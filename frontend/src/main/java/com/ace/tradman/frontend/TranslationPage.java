package com.ace.tradman.frontend;

import com.ace.tradman.county.Country;
import com.ace.tradman.county.CountryService;
import com.ace.tradman.language.LanguageService;
import com.ace.tradman.partner.Partner;
import com.ace.tradman.partner.PartnerService;
import com.ace.tradman.profile.Profile;
import com.ace.tradman.profile.ProfileService;
import com.ace.tradman.translation.*;
import lombok.AllArgsConstructor;
import lombok.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import static com.ace.tradman.frontend.ModelUtils.addConstToModel;
import static com.ace.tradman.frontend.TriggersConst.RELOAD_TRANSLATION_TABLE;

@Controller
@RequestMapping("/translation")
@AllArgsConstructor
public class TranslationPage {
    private final TranslationDefinitionService translationDefinitionService;
    private final TranslationService translationService;
    private final CountryService countryService;
    private final ProfileService profileService;
    private final PartnerService partnerService;
    private final LanguageService languageService;

    @GetMapping()
    public String main(Model model
    ) {
        addConstToModel(model);
        addDataForSearchForm(model);
        return "translation";
    }

    @GetMapping("/translation-search-form")
    public String translationSearchForm(Model model,
                                        HttpServletResponse response
    ) {
        addConstToModel(model);
        addDataForSearchForm(model);
        addTriggerHeader(response, RELOAD_TRANSLATION_TABLE);
        return "translation/translation_search_form";
    }

    private void addDataForSearchForm(Model model) {
        model.addAttribute("translationKeys", toSelectOptions(translationDefinitionService.allKeys()));
        model.addAttribute("partners", toSelectOptions(partnerService.findAll(), Partner::id, Partner::name));
        model.addAttribute("countries", toSelectOptions(countryService.findAll(), Country::getId, Country::getLabel));
        model.addAttribute("profiles", toSelectOptions(profileService.findAll(), Profile::id, Profile::name));
        model.addAttribute("languages", toSelectOptions(languageService.findAll()));
    }

    @PostMapping("/translation-table/{page}")
    public String translation_table(Model model,
                                    @ModelAttribute SearchTranslationQuery searchTranslationQuery,
                                    @PathVariable("page") int page
    ) throws InterruptedException {
        return showTable(model, page, searchTranslationQuery, "translation/translation_table_body");
    }
    @PostMapping("/translation-table/rows/{page}")
    public String translation_table2(Model model,
                                    @ModelAttribute SearchTranslationQuery searchTranslationQuery,
                                    @PathVariable("page") int page
    ) throws InterruptedException {
        Thread.sleep(1000);
        return showTable(model, page, searchTranslationQuery, "translation/translation_table_rows");
    }

    private String showTable(Model model, int page, SearchTranslationQuery searchTranslationQuery, String x) {
        addConstToModel(model);
        //   Thread.sleep(3000);
        Page attributeValue = translationService.filterBy(page, searchTranslationQuery);
        model.addAttribute("translations", attributeValue.getTranslations());
        model.addAttribute("currentPage", attributeValue.getCurrentPage());
        model.addAttribute("nextPage", attributeValue.getCurrentPage() + 1);
        model.addAttribute("totalElement", attributeValue.getTotalElement());
        model.addAttribute("pageSize", attributeValue.getPageSize());
        model.addAttribute("hasNextPage", attributeValue.isHasNextPage());
        return x;
    }

    @GetMapping("/new")
    public String newModal(Model model
    ) {
        addConstToModel(model);
        addDataForSearchForm(model);
        return "translation/new_translation_modal";
    }

    @GetMapping("/update/{partner}/{country}/{profile}/{language}/{key}")
    public String updateModal(Model model,
                              @PathVariable("partner") String partner,
                              @PathVariable("country") String country,
                              @PathVariable("profile") String profile,
                              @PathVariable("language") String language,
                              @PathVariable("key") String key
    ) {
        addConstToModel(model);
        addDataForSearchForm(model);
        Optional<Translation> translation = translationService.searchFor(partner, country, profile, language, key);
        translation.ifPresent(value -> model.addAttribute("translation", value));
        return "translation/new_translation_modal";
    }

    public <T> List<SelectOption> toSelectOptions(List<T> values, Function<T, String> valueGetter, Function<T, String> labelGetter) {
        return values.stream().map(v -> new SelectOption(valueGetter.apply(v), labelGetter.apply(v))).toList();
    }

    public List<SelectOption> toSelectOptions(List<String> values) {
        return toSelectOptions(values, Function.identity(), Function.identity());
    }

    @PostMapping()
    public void post(Model model,
                     HttpServletResponse response,
                     @ModelAttribute Translation translation
    ) {
        translationService.upsertTranslation(translation);
        //model.addAttribute("translations", translationService.findAll());
        // return "translation/translation_table_body";
        addTriggerHeader(response, RELOAD_TRANSLATION_TABLE);
    }

    private static void addTriggerHeader(HttpServletResponse response, String reloadTranslationTable) {
        response.addHeader("HX-Trigger-After-Settle", reloadTranslationTable);
    }

    @Value
    public static class SelectOption {
        String value;
        String label;
    }


}

package com.germoglio.ana_project_v3.petition;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.validation.BindingResult;


import java.time.LocalDate;
import java.util.List;

@Controller
@SessionAttributes("name")
public class PetitionController {

    public PetitionController(PetitionService petitionService) {
        super();
        this.petitionService = petitionService;
    }

    private PetitionService petitionService;

    @RequestMapping("list-petitions")
    public String listAllTodos(ModelMap model){

        List<Petition> petitions = petitionService.findByUsername("ana");
        model.addAttribute("petitions", petitions);

        return "listPetitions";
    }

    @RequestMapping(value="add-petition", method = RequestMethod.GET)
    public String showNewPetitionPage(ModelMap model){
        String username = (String)model.get("name");
        Petition petition = new Petition(0, username, "", LocalDate.now().plusYears(1), false, "");
        model.put("petition", petition);
        return "petition";
    }

    @RequestMapping(value="add-petition", method = RequestMethod.POST)
    public String addNewPetition(ModelMap model, @Valid Petition petition, BindingResult result){

        if(result.hasErrors()){
            return "petition";
        }

        String username = (String)model.get("name");
        petitionService.addPetition(username, petition.getDescription(), petition.getTargetDate(), false, petition.getEmail());
        return "redirect:list-petitions";
    }

    @RequestMapping("delete-petition")
    public String deletePetition(@RequestParam int id){

        petitionService.deleteById(id);

        return "redirect:list-petitions";
    }

    @RequestMapping(value="update-petition", method = RequestMethod.GET)
    public String showNewPetitionPage(@RequestParam int id, ModelMap model){
        Petition petition = petitionService.findById(id);
        model.addAttribute("petition", petition);
        return "petition";
    }

    @RequestMapping(value="update-petition", method = RequestMethod.POST)
    public String updatePetition(ModelMap model, @Valid Petition petition, BindingResult result){

        if(result.hasErrors()){
            return "petition";
        }

        String username = (String)model.get("name");
        petition.setUsername(username);
        petitionService.updatePetition(petition);
        return "redirect:list-petitions";
    }

}

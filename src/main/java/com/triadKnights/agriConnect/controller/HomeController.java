package com.triadKnights.agriConnect.controller;

import com.triadKnights.agriConnect.model.Product;
import com.triadKnights.agriConnect.repository.ProductRepository;
import com.triadKnights.agriConnect.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;

    @GetMapping("/")
//    @ResponseBody
    public String home(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
        int pageSize = 9;
        Page<Product> products = productService.getProducts(page, pageSize);
        model.addAttribute("products", products);
        System.out.println("total products" + products.getTotalElements());
        return "home";
    }
    @GetMapping("/home")
    public String home(Model model)
    {
        return "redirect:/";
    }
}

package com.shop.product.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.shop.common.Control;
import com.shop.product.service.ProductService;
import com.shop.product.service.ProductServiceImpl;
import com.shop.vo.ProductVO;

public class FilterProductList implements Control {

   @Override
   public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
      resp.setContentType("text/json;charset=utf-8");
      
      String categoryCode = req.getParameter("categoryCode");
        String filter = req.getParameter("filter");
        ProductService svc = new ProductServiceImpl();

        List<ProductVO> productList;
        Map<String, Object> params = new HashMap<>();
        params.put("categoryCode", Integer.parseInt(categoryCode));
        params.put("filter", filter);

        if (categoryCode.length() == 1) {
            productList = svc.filterProductTopList(params);
      
        } else if (categoryCode.length() == 2) {
            productList = svc.filterProductList(params);
        } else {
            productList = new ArrayList<>();
        }
        
        Gson gson = new GsonBuilder().create();
        String json = gson.toJson(productList);
        resp.getWriter().print(json);
         
      
   }

}

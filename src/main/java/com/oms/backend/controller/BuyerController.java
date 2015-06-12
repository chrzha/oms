package com.oms.backend.controller;

import com.oms.backend.entity.PaginationTableInfo;
import com.oms.backend.entity.Buyer;
import com.oms.backend.service.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 
 */
@Controller
@RequestMapping("buyer")
public class BuyerController {

    @Autowired
    private BuyerService buyerService;

    @RequestMapping(value = "/view/main", method = RequestMethod.GET)
    public String viewMain() {
        return "buyer_main";
    }

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
    public Map<String, Object> list(PaginationTableInfo pti) {
        int offset = pti.getOffset();
        int limit = pti.getLimit();
        
        List<Map<String, Object>> buyerList = buyerService.selectAll(offset, limit);

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("rows", buyerList);
        result.put("total", buyerList.size());

        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void save(Buyer buyer) {
        if (buyer.getBuyerId() == null){
            buyerService.insert(buyer);
        } else {
            buyerService.updateByPrimaryKey(buyer);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/retrieve/{buyerId}", method = RequestMethod.GET)
    public Buyer selectByPrimaryKey(@PathVariable("buyerId") Integer buyerId) {
        return buyerService.selectByPrimaryKey(buyerId);
    }
    
    @ResponseBody
    @RequestMapping(value = "/delete/{buyerId}", method = RequestMethod.POST)
    public void deleteByPrimaryKey(@PathVariable("buyerId") Integer buyerId) {
        buyerService.deleteByPrimaryKey(buyerId);
    }

}

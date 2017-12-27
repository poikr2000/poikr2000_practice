package com.naver.poikr2000;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.naver.poikr2000.entities.ZipcodeVO;
@Controller
public class ZipcodeController {
 
    public static final String ZIPCODE_API_KEY = "e615fd133ded67fb01513149078552";
    public static final String ZIPCODE_API_URL = "https://biz.epost.go.kr/KpostPortal/openapi"; // 요청 URL
     
    /**
     * 우편번호 화면
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/zipcode")
    public String zipcode() throws Exception {
         
        return "zipcode/zipcode";
    }
     
    /**
     * 우편번호 검색 결과
     * @param searchTO
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/zipcode/list", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
    public @ResponseBody String list( @RequestParam("dong") String dong) throws Exception {
         
        Map<String, Object> paramMap = new HashMap<String, Object>();
        String target="postNew";
        String countPerPage="20";
        String currentPage="1";
        // 요청 URL 생성
        StringBuilder queryUrl = new StringBuilder();
        queryUrl.append(ZIPCODE_API_URL);
        queryUrl.append("?regkey="+ZIPCODE_API_KEY+"&target="+target);
        queryUrl.append("&query="+dong);
        queryUrl.append("&countPerPage="+countPerPage);
        queryUrl.append("&currentPage="+currentPage);
        String url = queryUrl.toString();
        Document document = Jsoup.parse(new URL(url).openStream(),"UTF-8",url);
        System.out.println("---------------------"+document);
        String errorCode = document.select("error_code").text();
        Elements elements = document.select("item");
        List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
        ZipcodeVO zipcodeVO = null;
         
        for (Element element : elements) {
        	System.out.println("---------------"+element.select("postcd").text());
            zipcodeVO = new ZipcodeVO();
            zipcodeVO.setZipcode(element.select("postcd").text());
             
            // 도로명 검색일 경우
            if (dong.indexOf("Road") > -1) {
                zipcodeVO.setAddress(element.select("rnaddress").text());
                zipcodeVO.setLnmAddress(element.select("lnmaddress").text());
                 
                // 지번 검색일 경우
            } else {
                zipcodeVO.setAddress(element.select("address").text());
            }
             System.out.println("-------------------"+list.size());
            list.add(zipcodeVO);
        }
         
        paramMap.put("list", list);
        return (new Gson()).toJson(paramMap);
    }
}


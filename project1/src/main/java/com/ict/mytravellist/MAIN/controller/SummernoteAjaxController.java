package com.ict.mytravellist.MAIN.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.mytravellist.MAIN.service.TourTalkService;
import com.ict.mytravellist.vo.TourTalkVO;

@Controller
public class SummernoteAjaxController {

    @Autowired
    private TourTalkService tourTalkService;

    // 글 작성 처리
    @PostMapping("/tourTalk_write_ok")
    public ModelAndView tourTalkWriteOk(TourTalkVO tourtvo) {
        tourTalkService.insertTourTalk(tourtvo);
        return new ModelAndView("redirect:/travelDetail_go");
    }

    // 이미지 업로드 처리
    @PostMapping("/saveImg")
    @ResponseBody
    public Map<String, Object> saveImg(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
        String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
        Map<String, Object> response = new HashMap<>();
        try {
            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
            File uploadFile = new File(uploadPath, fileName);
            file.transferTo(uploadFile);
            response.put("url", "resources/upload/" + fileName);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("url", "");
        }
        return response;
    }

}

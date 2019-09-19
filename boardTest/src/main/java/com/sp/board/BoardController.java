package com.sp.board;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.FileManager;
import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("board.boardController")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	
	@RequestMapping(value="/board/list", method=RequestMethod.GET)
	public String boardList() {
		return ".board.list";
	}
	
	@RequestMapping(value="/board/write", method=RequestMethod.GET)
	public String writeForm(Model model) {
		model.addAttribute("mode", "write");
		
		return ".board.write";
	}
	
	@RequestMapping(value="/board/write", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> writeSend(Board dto,
			HttpServletRequest req,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "board";
		
		dto.setIdx(info.getUserIdx());
		dto.setIpAddr(req.getRemoteAddr());
		
		int result = boardService.insertBoard(dto, pathname);
		
		String state = "success";
		
		if(result == 0) {
			state = "fail";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/board/view", method=RequestMethod.GET)
	public String boardView() {
		return ".board.view";
	}
		
}

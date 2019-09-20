package com.sp.board;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value="/board/list")
	public String boardList(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		int total_page = 0;
		int dataCount = 0;
		int rows = 10;
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = boardService.dataCount(map);
		
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Board> list = boardService.listBoard(map);
		
		int boardNum, n = 0;
		
		for(Board dto : list) {
			boardNum = dataCount - (start + n - 1);
			dto.setBoardNum(boardNum);
			n++;
		}
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/board/list";
		String articleUrl = cp + "/board/view?page=" + current_page;
		
		if(searchValue.length() != 0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		
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
		
		String state = "success";
		
		/*try {
			dto.setIdx(info.getUserIdx());
		} catch (Exception e) {
			state = "fail";
			
			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			
			e.printStackTrace();
			
			return model;
		}*/
		
		dto.setIdx(info.getUserIdx());
		dto.setIpAddr(req.getRemoteAddr());
		
		int result = boardService.insertBoard(dto, pathname);
		
		if(result == 0) {
			state = "fail";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/board/view")
	public String boardView(@RequestParam int page,
			@RequestParam(defaultValue="all") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			@RequestParam int boardCode,
			HttpServletRequest req,
			Model model) throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		boardService.updateHitCount(boardCode);
		
		Board dto = boardService.readBoard(boardCode);
		if(dto == null) {
			return "redirect:/board/list";
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		String query = "?page=" + page;
		
		if(searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		
		return ".board.view";
	}
	
	@RequestMapping(value="/board/update", method=RequestMethod.GET)
	public String updateForm(@RequestParam int boardCode,
			@RequestParam int page,
			@RequestParam(defaultValue="all") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		searchValue = URLDecoder.decode(searchValue, "UTF-8");
		
		String query = "?page=" + page;
		
		if(searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		
		Board dto = boardService.readBoard(boardCode);
		
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		model.addAttribute("mode", "update");
		
		return ".board.write";
	}
	
	@RequestMapping(value="/barod/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(Board dto,
			HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		return model;
	}
	
	@RequestMapping(value="/board/download")
	public void download(@RequestParam int boardCode,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "board";
		
		Board dto = boardService.readBoard(boardCode);
		boolean flag = false;
		
		if(dto != null) {
			flag = fileManager.doFileDownload(dto.getSaveFilename(), dto.getOriginalFilename(), pathname, resp);
		}
		
		if(!flag) {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('파일 다운로드가 실패했습니다.');history.back();</script>");
		}
	}
	
}

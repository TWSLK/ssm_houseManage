package com.controller;

import java.io.File;


import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.entity.Sysuser;
import com.entity.Keep;
import com.server.KeepServer;
import com.server.FtypeServer;
import com.server.GoodsServer;
import com.server.SysuserServier;
import com.util.PageBean;

@Controller
public class KeepController {
	@Resource
	private KeepServer keepService;
	@Resource
	private SysuserServier userService;
	@Resource
	private GoodsServer goodsService;
	@Resource
	private FtypeServer typeService;

	// 收藏
	@RequestMapping("addKeep.do")
	public String addOrder(ModelMap map, HttpServletRequest request, Keep keep, HttpSession session, int fid) {
		Timestamp time = new Timestamp(System.currentTimeMillis());
		Sysuser user = (Sysuser) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			Map<String, Object> umap = new HashMap<>();
			umap.put("uid", user.getUid());
			umap.put("fid", fid);
			umap.put("status", "收藏");
			int num = keepService.getCount(umap);
			if (num >= 1) {
				session.setAttribute("info", "对不起！您已收藏过该房屋");
				return "error";
			} else {
				keep = new Keep();
				keep.setFid(fid);
				keep.setIsdel("1");
				keep.setPubtime(time.toString().substring(0, 19));
				keep.setStatus("收藏");
				keep.setUid(user.getUid());
				keepService.add(keep);
				map.put("tlist", typeService.getAll(null));
				return "redirect:myKeepList.do";
			}
		}
	}

	

	// 分页查询个人收藏信息
	@RequestMapping("myKeepList.do")
	public String myKeepList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		if (u == null || u.equals("")) {
			return "login";
		} else {
			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			Map<String, Object> umap = new HashMap<String, Object>();
			Map<String, Object> fmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			pmap.put("uid", u.getUid());
			umap.put("uid", u.getUid());
			pmap.put("status", "收藏");
			umap.put("status", "收藏");
			int total = keepService.getCount(umap);
			pageBean.setTotal(total);
			List<Keep> list = keepService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("plist", goodsService.getAll(null));
			map.put("ulist", userService.getAll(fmap));
			map.put("tlist", typeService.getAll(null));
			return "myKeepList";
		}
	}
	
	@RequestMapping("deleteKeep.do")
	public String deleteKeep(int id) {
		keepService.delete(id);
		return "redirect:myKeepList.do";
	}

	
	@RequestMapping("deleteOrder.do")
	public String deleteOrder(int id) {
		keepService.delete(id);
		return "redirect:orderList.do";
	}
	
	// 文件上传
	public String fileUpload(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, String img) {
		String path = request.getSession().getServletContext().getRealPath("upload");
		System.out.println("path===" + path);
		System.out.println("file===" + file);
		String fileName = file.getOriginalFilename();
		System.out.println("fileName===" + fileName);
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String pa = request.getContextPath() + "/upload/" + fileName;
		System.out.println("path===" + pa);
		if (fileName != null && !fileName.equals("")) {
			img = fileName;
		} else {
			img = null;
		}

		return img;

	}
}

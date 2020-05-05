package com.controller;

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
import com.entity.Sysuser;
import com.entity.Bbs;
import com.entity.BbsWithBLOBs;
import com.entity.Goods;
import com.server.BbsServer;
import com.server.FtypeServer;
import com.server.GoodsServer;
import com.server.SysuserServier;
import com.util.PageBean;

@Controller
public class BbsController {
	@Resource
	private BbsServer bbsService;
	@Resource
	private SysuserServier userService;
	@Resource
	private GoodsServer goodsService;
	@Resource
	private FtypeServer typeService;

	// 分页查询个人留言信息
	@RequestMapping("bbsList.do")
	public String bbsList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		Map<String, Object> umap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		pmap.put("btype", "留言");
		umap.put("btype", "留言");
		int total = bbsService.getCount(umap);
		pageBean.setTotal(total);
		List<BbsWithBLOBs> list = bbsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);

		map.put("ulist", userService.getAll(null));
		map.put("tlist", typeService.getAll(null));
		return "bbsList";
	}

	@RequestMapping("myBbsList.do")
	public String mybbsList(@RequestParam(value = "page", required = false) String page, ModelMap map,
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
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			pmap.put("uid", u.getUid());
			umap.put("uid", u.getUid());
			int total = bbsService.getCount(umap);
			pageBean.setTotal(total);
			List<BbsWithBLOBs> list = bbsService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("ulist", userService.getAll(null));
			map.put("tlist", typeService.getAll(null));
			return "myBbsList";
		}
	}

	// 分页查询个人回复信息
	@RequestMapping("bbsList_huiFu.do")
	public String bbsList_huiFu(@RequestParam(value = "page", required = false) String page, ModelMap map,
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
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			pmap.put("did", u.getUid());
			umap.put("did", u.getUid());
			int total = bbsService.getCount(umap);
			pageBean.setTotal(total);
			List<BbsWithBLOBs> list = bbsService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("ulist", userService.getAll(null));
			map.put("tlist", typeService.getAll(null));
			return "myBbsList_huifu";
		}
	}

	@RequestMapping("deleteBbs.do")
	public String deleteBbs(int id) {
		bbsService.delete(id);
		return "redirect:bbsList.do";
	}

	// 显示留言的信息
	@RequestMapping("showBbs.do")
	public String showBbs(ModelMap map, int id) {
		BbsWithBLOBs bbs = bbsService.getById(id);
		Map<String, Object> bmap = new HashMap<>();
		bmap.put("bid", id);
		bmap.put("btype", "回复");
		List<BbsWithBLOBs> blist = bbsService.getAll(bmap);
		map.put("bbs", bbs);
		map.put("blist", blist);
		map.put("ulist", userService.getAll(null));
		return "bbsx";
	}

	// 添加回复留言
	@RequestMapping("addBbs_huiFu.do")
	public String addBbs_huiFu(HttpServletRequest request, BbsWithBLOBs bbs, HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		if (u == null) {
			return "login";
		} else {
			bbs.setHid(u.getUid());
			bbs.setSta("回复");
			bbs.setBtype("回复");
			bbs.setHtime(time.toString().substring(0, 19));
			bbsService.add(bbs);
			return "redirect:showBbs.do?id=" + bbs.getBid();
		}

	}

	// 联系卖家
	@RequestMapping("doAddBbs.do")
	public String doAddBbs(ModelMap map, int did, HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		if (u == null) {
			return "login";
		} else {
			Goods goods = goodsService.getById(did);
			Sysuser user = userService.getById(Integer.parseInt(goods.getUid()));
			map.put("user", user);
			map.put("goods", goods);
			map.put("tlist", typeService.getAll(null));
			return "addBbs";
		}
	}

	// 添加留言
	@RequestMapping("addBbs.do")
	public String addBbs(HttpServletRequest request, BbsWithBLOBs bbs, HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		if (u == null) {
			return "login";
		} else {
			bbs.setUid(u.getUid());
			bbs.setSta("待回复");
			bbs.setBtype("留言");
			bbs.setPubtime(time.toString().substring(0, 19));
			bbsService.add(bbs);
			return "redirect:bbsList.do";
		}

	}

	// 回复留言咨询
	@RequestMapping("updateBbs.do")
	public String updateBbs(HttpServletRequest request, BbsWithBLOBs bbs, HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		if (u == null) {
			return "login";
		} else {
			bbs.setSta("已回复");
			bbs.setHtime(time.toString().substring(0, 19));
			bbsService.update(bbs);
			return "redirect:bbsList_huiFu.do";
		}
	}

	@RequestMapping("doUpdateBbs.do")
	public String doUpdateBbs(HttpServletRequest request, int id, ModelMap map) {
		Bbs bbs = bbsService.getById(id);
		Goods goods = goodsService.getById(Integer.parseInt(bbs.getName()));
		Sysuser u = userService.getById(bbs.getUid());
		map.put("bbs", bbs);
		map.put("goods", goods);
		map.put("user", u);
		map.put("tlist", typeService.getAll(null));
		return "update_bbs";
	}

	// 分页查询 留言信息的列表
	@RequestMapping("admin/bbsList.do")
	public String bbsList2(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		Map<String, Object> bmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());

		int total = bbsService.getCount(bmap);
		pageBean.setTotal(total);
		List<BbsWithBLOBs> list = bbsService.getByPage(pmap);
		List<Sysuser> ulist = userService.getAll(null);
		String aa = "dddd";
		aa.length();
		map.put("page", pageBean);
		map.put("list", list);
		map.put("ulist", ulist);
		session.setAttribute("p", 1);
		return "admin/list_bbs";

	}

	@RequestMapping("admin/deleteBbs.do")
	public String deleteBbs2(int id) {
		bbsService.delete(id);
		return "admin/success";
	}
}

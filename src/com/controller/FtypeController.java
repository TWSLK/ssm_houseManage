package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Ftype;
import com.server.FtypeServer;
import com.server.GoodsServer;
import com.util.PageBean;

import net.sf.json.JSONObject;

@Controller
public class FtypeController {
	@Resource
	private FtypeServer FtypeService;
	@Resource
	private GoodsServer goodsService;

	@RequestMapping("admin/addType.do")
	public void addFtype(Ftype Ftype, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", Ftype.getName());
		System.out.println("uname===" + FtypeService.checkUname(map));
		JSONObject obj = new JSONObject();
		if (FtypeService.checkUname(map) != null) {
			obj.put("info", "ok");
		} else {
			Ftype Ftype1 = new Ftype();
			Ftype1.setName(Ftype.getName());
			FtypeService.add(Ftype1);
			obj.put("info", "可以用！");

		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}

	}

	@RequestMapping("admin/doUpdateFtype.do")
	public String doUpdateFtype(ModelMap map, int id) {
		map.put("ftype", FtypeService.getById(id));
		return "admin/update_ftype";
	}

	// 保存更新类别的名称
	@RequestMapping("admin/updateTypeName.do")
	public void updateTypeName(Ftype Ftype, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", Ftype.getName());
		System.out.println("uname===" + FtypeService.checkUname(map));
		System.out.println("btype===" + Ftype.getBtype());
		JSONObject obj = new JSONObject();
		Ftype type = FtypeService.checkUname(map);
		if (FtypeService.checkUname(map) != null) {
			if (type.getName().equals(Ftype.getName())) {
				obj.put("info", "ok");
			} else {
				obj.put("info", "ng");
			}
		} else {
			Ftype type1 = FtypeService.getById(Ftype.getId());
			type1.setName(Ftype.getName());
			FtypeService.update(type1);
			obj.put("info", "ok");

		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}

	}

	// 分页查询
	@RequestMapping("admin/TypeList.do")
	public String goodList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		int total = FtypeService.getCount(null);
		pageBean.setTotal(total);
		List<Ftype> list = FtypeService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "admin/list_type";
	}

	@RequestMapping("admin/deleteFtype.do")
	public String deleteFtype(int id, HttpSession session) {
		Map<String, Object> bmap = new HashMap<>();
		bmap.put("fid", id);
		int count = goodsService.getCount(bmap);
		if (count > 0) {
			session.setAttribute("info", "该类别下有商品不可删除！");
			return "admin/error_delete";
		} else {
			FtypeService.delete(id);
			return "redirect:TypeList.do";
		}

	}

}

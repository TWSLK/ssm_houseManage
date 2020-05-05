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

import com.entity.Ftype;
import com.entity.Goods;
import com.entity.Keep;
import com.entity.Sysuser;
import com.server.FtypeServer;
import com.server.GoodsServer;
import com.server.SysuserServier;
import com.server.KeepServer;
import com.util.PageBean;

@Controller
public class GoodsController {
	@Resource
	private GoodsServer goodsService;
	@Resource
	private FtypeServer typeService;
	@Resource
	private KeepServer keepService;
	@Resource
	private SysuserServier userService;

	// 分页查询--显示个人的房屋信息
	@RequestMapping("myGoodsList.do")
	public String myGoodsList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			Map<String, Object> umap = new HashMap<>();
			umap.put("uid", user.getUid());
			int num = goodsService.getCount(umap);
			if (num == 0) {
				return "redirect:doAddGoods.do";
			} else {
				if (page == null || page.equals("")) {
					page = "1";
				}
				PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
				Map<String, Object> pmap = new HashMap<String, Object>();
				pmap.put("pageno", pageBean.getStart());
				pmap.put("pageSize", pageBean.getPageSize());
				Map<String, Object> cmap = new HashMap<String, Object>();
				pmap.put("uid", user.getUid());
				cmap.put("uid", user.getUid());
				pmap.put("btype", "出租");
				cmap.put("btype", "出租");
				int total = goodsService.getCount(cmap);
				pageBean.setTotal(total);
				List<Goods> list = goodsService.getByPage(pmap);
				map.put("page", pageBean);
				map.put("list", list);
				map.put("tlist", typeService.getAll(null));
				session.setAttribute("p", 1);
				List<Ftype> tlist = typeService.getAll(null);
				map.put("tlist", tlist);
				return "myGoodslist";
			}
		}
	}

	// 处理添加房屋的信息
	@RequestMapping("doAddGoods.do")
	public String doAddGoods(ModelMap map, HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			List<Ftype> tlist = typeService.getAll(null);
			map.put("tlist", tlist);
			return "addGoods";
		}
	}

	// 添加房屋信息
	@RequestMapping("addGoods.do")
	public String addGoods(@RequestParam(value = "file", required = false) MultipartFile file, String img,
			HttpServletRequest request, Goods Goods, HttpSession session) {
		System.out.println("ddddd");
		Sysuser u = (Sysuser) session.getAttribute("user");
		System.out.println("u=-=" + u);
		if (u == null || u.equals("")) {
			return "login";
		} else {
			Ftype ftype = typeService.getById(Goods.getFid());
			Goods.setBtype(ftype.getBtype());
			img = fileUpload(file, request, img);
			if (img != null) {
				Goods.setImg(img);
			}
			Goods.setIscommend("非推荐");
			Goods.setBtype("出租");
			Goods.setStatus("待审核");
			java.sql.Timestamp time = new Timestamp(System.currentTimeMillis());
			Goods.setPubtime(time.toString().substring(0, 19));
			Goods.setUid(u.getUid() + "");
			goodsService.add(Goods);
			return "redirect:myGoodsList.do";
		}
	}

	// 处理更新房屋的信息
	@RequestMapping("doUpdateGoods.do")
	public String doUpdateGoods(ModelMap map, int id) {
		map.put("goods", goodsService.getById(id));
		List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
		return "update_Goods";
	}

	@RequestMapping("updateGoods.do")
	public String updateGoods(@RequestParam(value = "file", required = false) MultipartFile file, String img,
			HttpServletRequest request, Goods Goods) {
		img = fileUpload(file, request, img);
		if (img != null && !img.equals("zanwu.jpg")) {
			Goods.setImg(img);
		}
		Ftype ftype = typeService.getById(Goods.getFid());
		Goods.setBtype(ftype.getBtype());
		goodsService.update(Goods);
		return "redirect:myGoodsList.do";
	}
	@RequestMapping("deleteGoods.do")
	public String deleteGoods(int id) {
		Map<String, Object> map = new HashMap<>();
		map.put("fid", id);
		List<Keep> klist = keepService.getAll(map);
		Keep keep = new Keep();
		if (klist.size() > 0) {
			for (Keep k : klist) {
				keep = keepService.getById(k.getId());
				keep.setStatus("已删除");
				keepService.update(keep);
			}
		}
		goodsService.delete(id);
		return "redirect:myGoodsList.do";
	}

	/**
	 * ===求租房屋管理===
	 * 
	 * @param map
	 * @param fid
	 * @return
	 */

	// 分页查询--显示个人的房屋信息
	@RequestMapping("myGoodsList_qz.do")
	public String myGoodsList_qz(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			Map<String, Object> umap = new HashMap<>();
			umap.put("uid", user.getUid());
			int num = goodsService.getCount(umap);
			if (num == 0) {
				return "redirect:doAddGoods_qz.do";
			} else {
				if (page == null || page.equals("")) {
					page = "1";
				}
				PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
				Map<String, Object> pmap = new HashMap<String, Object>();
				pmap.put("pageno", pageBean.getStart());
				pmap.put("pageSize", pageBean.getPageSize());
				Map<String, Object> cmap = new HashMap<String, Object>();
				pmap.put("uid", user.getUid());
				cmap.put("uid", user.getUid());
				pmap.put("btype", "求租");
				cmap.put("btype", "求租");
				int total = goodsService.getCount(cmap);
				pageBean.setTotal(total);
				List<Goods> list = goodsService.getByPage(pmap);
				map.put("page", pageBean);
				map.put("list", list);
				map.put("tlist", typeService.getAll(null));
				session.setAttribute("p", 1);
				List<Ftype> tlist = typeService.getAll(null);
				map.put("tlist", tlist);
				return "myGoodslist_qz";
			}
		}
	}

	// 处理添加房屋的信息
	@RequestMapping("doAddGoods_qz.do")
	public String doAddGoods_qz(ModelMap map, HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			List<Ftype> tlist = typeService.getAll(null);
			map.put("tlist", tlist);
			return "addGoods_qz";
		}
	}

	// 添加房屋信息
	@RequestMapping("addGoods_qz.do")
	public String addGoods_qz(@RequestParam(value = "file", required = false) MultipartFile file, String img,
			HttpServletRequest request, Goods Goods, HttpSession session) {
		System.out.println("ddddd");
		Sysuser u = (Sysuser) session.getAttribute("user");
		System.out.println("u=-=" + u);
		if (u == null || u.equals("")) {
			return "login";
		} else {
			Ftype ftype = typeService.getById(Goods.getFid());
			Goods.setBtype(ftype.getBtype());
			img = fileUpload(file, request, img);
			if (img != null) {
				Goods.setImg(img);
			}
			Goods.setIscommend("非推荐");
			Goods.setBtype("求租");
			Goods.setStatus("待审核");
			java.sql.Timestamp time = new Timestamp(System.currentTimeMillis());
			Goods.setPubtime(time.toString().substring(0, 19));
			Goods.setUid(u.getUid() + "");
			goodsService.add(Goods);
			return "redirect:myGoodsList_qz.do";
		}
	}

	// 处理更新房屋的信息
	@RequestMapping("doUpdateGoods_qz.do")
	public String doUpdateGoods_qz(ModelMap map, int id) {
		map.put("goods", goodsService.getById(id));
		List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
		return "update_Goods_qz";
	}

	@RequestMapping("updateGoods_qz.do")
	public String updateGoods_qz(@RequestParam(value = "file", required = false) MultipartFile file, String img,
			HttpServletRequest request, Goods Goods) {
		img = fileUpload(file, request, img);
		if (img != null && !img.equals("zanwu.jpg")) {
			Goods.setImg(img);
		}
		Ftype ftype = typeService.getById(Goods.getFid());
		Goods.setBtype(ftype.getBtype());
		goodsService.update(Goods);
		return "redirect:myGoodsList_qz.do";
	}

	@RequestMapping("deleteGoods_qz.do")
	public String deleteGoods_qz(int id) {
		Map<String, Object> map = new HashMap<>();
		map.put("fid", id);
		List<Keep> klist = keepService.getAll(map);
		Keep keep = new Keep();
		if (klist.size() > 0) {
			for (Keep k : klist) {
				keep = keepService.getById(k.getId());
				keep.setStatus("已删除");
				keepService.update(keep);
			}
		}
		goodsService.delete(id);
		return "redirect:myGoodsList_qz.do";
	}

	// 显示一类房屋
	@RequestMapping("showGoodsType.do")
	public String showGoodsType(ModelMap map, int fid) {
		Map<String, Object> tmap0 = new HashMap<>();
		tmap0.put("fid", fid);
		tmap0.put("btype", "出租");
		map.put("list", goodsService.getAll(tmap0));
		map.put("tlist", typeService.getAll(null));
		map.put("ulist", userService.getAll(null));
		List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
		return "goodslist";
	}

	// 显示一类房屋
	@RequestMapping("showGoodsType_qz.do")
	public String showGoodsType_cs(ModelMap map, int fid) {
		Map<String, Object> tmap0 = new HashMap<>();
		tmap0.put("fid", fid);
		tmap0.put("btype", "求租");
		map.put("list", goodsService.getAll(tmap0));
		map.put("tlist", typeService.getAll(null));
		map.put("ulist", userService.getAll(null));
		List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
		return "goodslist_qz";
	}

	// 显示单个房屋的信息
	@RequestMapping("showGoodsx.do")
	public String showGoodsx(ModelMap map, int id) {
		Goods goods = goodsService.getById(id);
		goodsService.update(goods);
		map.put("goods", goodsService.getById(id));
		map.put("tlist", typeService.getAll(null));
		map.put("ulist", userService.getAll(null));
		List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
		return "goodsx";
	}

	// 分页---房屋信息
	@RequestMapping("showGoodsList.do")
	public String showGoods(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods cd) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		Map<String, Object> cmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		cmap.put("btype", "出租");
		pmap.put("btype", "出租");
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		map.put("tlist", typeService.getAll(null));
		map.put("ulist", userService.getAll(null));
		List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
		return "goodslist";
	}

	@RequestMapping("showGoodsList_qz.do")
	public String showGoodsList_qz(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods cd) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		Map<String, Object> cmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		cmap.put("btype", "求租");
		pmap.put("btype", "求租");
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		map.put("tlist", typeService.getAll(null));
		map.put("ulist", userService.getAll(null));
		List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
		return "goodslist_cs";
	}

	// 分页---房屋信息--推荐
	@RequestMapping("showGoodsList_commend.do")
	public String showGoodsList_commend(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods cd) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		Map<String, Object> cmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		cmap.put("iscommend", "推荐");
		pmap.put("iscommend", "推荐");
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 3);
		// map.put("tlist", typeService.getAll(null));
		map.put("ulist", userService.getAll(null));
		List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
		return "goodslist";
	}

	// ---房屋信息--排行榜--top10
	@RequestMapping("showGoodsList_top_all.do")
	public String showGoodsList_top_all(ModelMap map, HttpSession session, Goods goods) {
		List<Goods> list = goodsService.getTop10(null);
		session.setAttribute("p", 3);
		List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
		map.put("list", list);
		return "goods_top10";
	}

	
	
	
	/**
	 * ====出租房屋管理===
	 * 
	 * @param page
	 * @param map
	 * @param session
	 * @param cd
	 * @return
	 */
	// 分页模糊查询
	@RequestMapping("selectGoodsList.do")
	public String SelectGoods(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods cd) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());

		Map<String, Object> cmap = new HashMap<String, Object>();
		System.out.println("name===" + cd.getName());
		if (cd.getName() != null && !cd.getName().equals("")) {
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());

		}
		if (cd.getFid() != null && !cd.getFid().equals("")) {
			cmap.put("fid", cd.getFid());
			pmap.put("fid", cd.getFid());
		}
		cmap.put("btype", "出租");
		pmap.put("btype", "出租");
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		map.put("tlist", typeService.getAll(null));
		List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
		return "goodslist";
	}

	@RequestMapping("selectGoodsList_cs.do")
	public String selectGoodsList_cs(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods cd) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());

		Map<String, Object> cmap = new HashMap<String, Object>();
		System.out.println("name===" + cd.getName());
		if (cd.getName() != null && !cd.getName().equals("")) {
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());

		}
		if (cd.getFid() != null && !cd.getFid().equals("")) {
			cmap.put("fid", cd.getFid());
			pmap.put("fid", cd.getFid());
		}
		cmap.put("btype", "出售");
		pmap.put("btype", "出售");
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getAll(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		map.put("tlist", typeService.getAll(null));
		List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
		return "goodslist_cs";
	}

	
	
	
	
	/**
	 * ===出售房屋管理===
	 * 
	 * @param map
	 * @param fid
	 * @return
	 */

	// 分页查询--显示个人的房屋信息
	@RequestMapping("myGoodsList_cs.do")
	public String myGoodsList_cs(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			Map<String, Object> umap = new HashMap<>();
			umap.put("uid", user.getUid());
			int num = goodsService.getCount(umap);
			if (num == 0) {
				return "redirect:doAddGoods_cs.do";
			} else {
				if (page == null || page.equals("")) {
					page = "1";
				}
				PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
				Map<String, Object> pmap = new HashMap<String, Object>();
				pmap.put("pageno", pageBean.getStart());
				pmap.put("pageSize", pageBean.getPageSize());
				Map<String, Object> cmap = new HashMap<String, Object>();
				pmap.put("uid", user.getUid());
				cmap.put("uid", user.getUid());
				pmap.put("btype", "出售");
				cmap.put("btype", "出售");
				int total = goodsService.getCount(cmap);
				pageBean.setTotal(total);
				List<Goods> list = goodsService.getByPage(pmap);
				map.put("page", pageBean);
				map.put("list", list);
				map.put("tlist", typeService.getAll(null));
				session.setAttribute("p", 1);
				List<Ftype> tlist = typeService.getAll(null);
				map.put("tlist", tlist);
				return "myGoodslist_cs";
			}
		}
	}

	// 处理添加房屋的信息
	@RequestMapping("doAddGoods_cs.do")
	public String doAddGoods_cs(ModelMap map, HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			List<Ftype> tlist = typeService.getAll(null);
			map.put("tlist", tlist);
			return "addGoods_cs";
		}
	}

	// 添加房屋信息
	@RequestMapping("addGoods_cs.do")
	public String addGoods_cs(@RequestParam(value = "file", required = false) MultipartFile file, String img,
			HttpServletRequest request, Goods Goods, HttpSession session) {
		System.out.println("ddddd");
		Sysuser u = (Sysuser) session.getAttribute("user");
		System.out.println("u=-=" + u);
		if (u == null || u.equals("")) {
			return "login";
		} else {
			Ftype ftype = typeService.getById(Goods.getFid());
			Goods.setBtype(ftype.getBtype());
			img = fileUpload(file, request, img);
			if (img != null) {
				Goods.setImg(img);
			}
			Goods.setIscommend("非推荐");
			Goods.setBtype("出售");
			Goods.setStatus("待审核");
			java.sql.Timestamp time = new Timestamp(System.currentTimeMillis());
			Goods.setPubtime(time.toString().substring(0, 19));
			Goods.setUid(u.getUid() + "");
			goodsService.add(Goods);
			return "redirect:myGoodsList_cs.do";
		}
	}

	// 处理更新房屋的信息
	@RequestMapping("doUpdateGoods_cs.do")
	public String doUpdateGoods_cs(ModelMap map, int id) {
		map.put("goods", goodsService.getById(id));
		List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
		return "update_Goods_cs";
	}

	@RequestMapping("updateGoods_cs.do")
	public String updateGoods_cs(@RequestParam(value = "file", required = false) MultipartFile file, String img,
			HttpServletRequest request, Goods Goods) {
		img = fileUpload(file, request, img);
		if (img != null && !img.equals("zanwu.jpg")) {
			Goods.setImg(img);
		}
		Ftype ftype = typeService.getById(Goods.getFid());
		Goods.setBtype(ftype.getBtype());
		goodsService.update(Goods);
		return "redirect:myGoodsList_cs.do";
	}

	@RequestMapping("deleteGoods_cs.do")
	public String deleteGoods_cs(int id) {
		Map<String, Object> map = new HashMap<>();
		map.put("fid", id);
		List<Keep> klist = keepService.getAll(map);
		Keep keep = new Keep();
		if (klist.size() > 0) {
			for (Keep k : klist) {
				keep = keepService.getById(k.getId());
				keep.setStatus("已删除");
				keepService.update(keep);
			}
		}
		goodsService.delete(id);
		return "redirect:myGoodsList_cs.do";
	}

	
	


	@RequestMapping("showGoodsList_cs.do")
	public String showGoodsList_cs(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods cd) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		Map<String, Object> cmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		cmap.put("btype", "出售");
		pmap.put("btype", "出售");
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		map.put("tlist", typeService.getAll(null));
		map.put("ulist", userService.getAll(null));
		List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
		return "goodslist_cs";
	}

	
	
	
	
	
	
	
	// 处理审核房屋的信息
		@RequestMapping("admin/tongGuo.do")
		public String tongGuo(ModelMap map,int id) {
			Goods goods = goodsService.getById(id);
			goods.setStatus("通过审核");
			goodsService.update(goods);
			return "admin/success";
		}
		@RequestMapping("admin/buTongGuo.do")
		public String buTongGuo(ModelMap map,int id) {
			Goods goods = goodsService.getById(id);
			goods.setStatus("审核失败");
			goodsService.update(goods);
			return "admin/success";
		}
	
	
	/**
	 * 后台出租房屋的处理
	 * 
	 * @param file
	 * @param request
	 * @param img
	 * @return
	 */

	// 处理添加房屋的信息
	@RequestMapping("admin/doAddGoods_admin.do")
	public String doAddGoods_admin(ModelMap map, HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("auser");
		if (user == null) {
			return "admin/login";
		} else {
			map.put("tlist", typeService.getAll(null));
			return "admin/goods_add";
		}
	}

	// 添加房屋信息
	@RequestMapping("admin/addGoods_admin.do")
	public String addGoods_admin(@RequestParam(value = "file", required = false) MultipartFile file, String img,
			HttpServletRequest request, Goods Goods, HttpSession session) {
		System.out.println("ddddd");
		Sysuser u = (Sysuser) session.getAttribute("auser");
		System.out.println("u=-=" + u);
		if (u == null || u.equals("")) {
			return "admin/login";
		} else {
			img = fileUpload(file, request, img);
			if (img != null) {
				Goods.setImg(img);
			} else {
				Goods.setImg("zanwu.jpg");
			}
			Goods.setBtype("出租");
			Goods.setStatus("通过审核");
			java.sql.Timestamp time = new Timestamp(System.currentTimeMillis());
			Goods.setPubtime(time.toString().substring(0, 19));
			Goods.setUid(u.getUid() + "");
			goodsService.add(Goods);
			return "redirect:goodsList.do";
		}
	}

	// 处理更新房屋的信息
	@RequestMapping("admin/doUpdateGoods_admin.do")
	public String doUpdateGoods_admin(ModelMap map, int id) {
		map.put("goods", goodsService.getById(id));
		map.put("tlist", typeService.getAll(null));
		return "admin/goods_update";
	}

	// 处理更新房屋的信息
	@RequestMapping("admin/deleteGoods_admin.do")
	public String deleteGoods_admin(ModelMap map, int id) {
		goodsService.delete(id);
		return "redirect:goodsList.do";
	}

	// 房屋推荐
	@RequestMapping("admin/doUpdateGoods_tuiJian.do")
	public String doUpdateGoods_tuiJian(ModelMap map, int id) {
		Goods goods = goodsService.getById(id);
		goods.setIscommend("推荐");
		goodsService.update(goods);
		return "redirect:goodsList.do";
	}

	@RequestMapping("admin/updateGoods_admin.do")
	public String updateGoods_admin(@RequestParam(value = "file", required = false) MultipartFile file, String img,
			HttpServletRequest request, Goods Goods) {
		img = fileUpload(file, request, img);
		if (img != null && !img.equals("zanwu.jpg")) {
			Goods.setImg(img);
		}
		goodsService.update(Goods);
		return "redirect:goodsList.do";
	}

	// 分页查询--显示所有的房屋信息
	@RequestMapping("admin/goodsList.do")
	public String goodsList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("auser");
		System.out.println("u=-=" + u);
		if (u == null || u.equals("")) {
			return "admin/login";
		} else {
			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			Map<String, Object> cmap = new HashMap<String, Object>();
			/*if (u.getUtype().equals("管理员")) {
				pmap.put("uid", u.getUid());
				cmap.put("uid", u.getUid());
			}*/
			pmap.put("btype", "出租");
			cmap.put("btype", "出租");
			int total = goodsService.getCount(cmap);
			pageBean.setTotal(total);
			List<Goods> list = goodsService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("tlist", typeService.getAll(null));
			map.put("ulist", userService.getAll(null));
			session.setAttribute("p", 1);
			return "admin/goods_list";
		}
	}

	// 分页查询--查询所有的房屋信息
	@RequestMapping("admin/goodsList_search.do")
	public String goodsList_search(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods goods) {
		Sysuser u = (Sysuser) session.getAttribute("auser");
		System.out.println("u=-=" + u);
		if (u == null || u.equals("")) {
			return "admin/login";
		} else {
			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			Map<String, Object> cmap = new HashMap<String, Object>();
			/*if (u.getUtype().equals("管理员")) {
				pmap.put("uid", u.getUid());
				cmap.put("uid", u.getUid());
			}*/
			if (goods.getFid() != null && !goods.getFid().equals("")) {
				pmap.put("fid", goods.getFid());
				cmap.put("fid", goods.getFid());
			}
			if (goods.getName() != null && !goods.getName().equals("")) {
				pmap.put("name", goods.getName());
				cmap.put("name", goods.getName());
			}
			pmap.put("btype", "出租");
			cmap.put("btype", "出租");
			int total = goodsService.getCount(cmap);
			pageBean.setTotal(total);
			List<Goods> list = goodsService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("tlist", typeService.getAll(null));
			map.put("ulist", userService.getAll(null));
			session.setAttribute("p", 2);
			return "admin/goods_list";
		}
	}

	/**
	 * 后台求租房屋的处理
	 * 
	 * @param file
	 * @param request
	 * @param img
	 * @return
	 */

	// 处理添加房屋的信息
	@RequestMapping("admin/doAddGoods_qz_admin.do")
	public String doAddGoods_qz_admin(ModelMap map, HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("auser");
		if (user == null) {
			return "admin/login";
		} else {
			map.put("tlist", typeService.getAll(null));
			return "admin/goods_add_qz";
		}
	}

	// 添加房屋信息
	@RequestMapping("admin/addGoods_qz_admin.do")
	public String addGoods_qz_admin(@RequestParam(value = "file", required = false) MultipartFile file, String img,
			HttpServletRequest request, Goods Goods, HttpSession session) {
		System.out.println("ddddd");
		Sysuser u = (Sysuser) session.getAttribute("auser");
		System.out.println("u=-=" + u);
		if (u == null || u.equals("")) {
			return "admin/login";
		} else {
			img = fileUpload(file, request, img);
			if (img != null) {
				Goods.setImg(img);
			} else {
				Goods.setImg("zanwu.jpg");
			}
			Goods.setBtype("求租");
			Goods.setStatus("通过审核");
			java.sql.Timestamp time = new Timestamp(System.currentTimeMillis());
			Goods.setPubtime(time.toString().substring(0, 19));
			Goods.setUid(u.getUid() + "");
			goodsService.add(Goods);
			return "redirect:goodsList_qz.do";
		}
	}

	// 处理更新房屋的信息
	@RequestMapping("admin/doUpdateGoods_qz_admin.do")
	public String doUpdateGoods_qz_admin(ModelMap map, int id) {
		map.put("goods", goodsService.getById(id));
		map.put("tlist", typeService.getAll(null));
		return "admin/goods_update_qz";
	}

	// 处理更新房屋的信息
	@RequestMapping("admin/deleteGoods_qz_admin.do")
	public String deleteGoods_qz_admin(ModelMap map, int id) {
		goodsService.delete(id);
		return "redirect:goodsList_qz.do";
	}

	// 房屋推荐
	@RequestMapping("admin/doUpdateGoods_qz_tuiJian.do")
	public String doUpdateGoods_qz_tuiJian(ModelMap map, int id) {
		Goods goods = goodsService.getById(id);
		goods.setIscommend("推荐");
		goodsService.update(goods);
		return "redirect:goodsList_qz.do";
	}

	@RequestMapping("admin/updateGoods_qz_admin.do")
	public String updateGoods_qz_admin(@RequestParam(value = "file", required = false) MultipartFile file, String img,
			HttpServletRequest request, Goods Goods) {
		img = fileUpload(file, request, img);
		if (img != null && !img.equals("zanwu.jpg")) {
			Goods.setImg(img);
		}
		goodsService.update(Goods);
		return "redirect:goodsList_qz.do";
	}

	// 分页查询--显示所有的房屋信息
	@RequestMapping("admin/goodsList_qz.do")
	public String goodsList_qz(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("auser");
		System.out.println("u=-=" + u);
		if (u == null || u.equals("")) {
			return "admin/login";
		} else {
			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			Map<String, Object> cmap = new HashMap<String, Object>();
			/*if (u.getUtype().equals("管理员")) {
				pmap.put("uid", u.getUid());
				cmap.put("uid", u.getUid());
			}*/
			pmap.put("btype", "求租");
			cmap.put("btype", "求租");
			int total = goodsService.getCount(cmap);
			pageBean.setTotal(total);
			List<Goods> list = goodsService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("tlist", typeService.getAll(null));
			map.put("ulist", userService.getAll(null));
			session.setAttribute("p", 1);
			return "admin/goods_list_cs";
		}
	}

	// 分页查询--查询所有的房屋信息
	@RequestMapping("admin/goodsList_qz_search.do")
	public String goodsList_qz_search(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods goods) {
		Sysuser u = (Sysuser) session.getAttribute("auser");
		System.out.println("u=-=" + u);
		if (u == null || u.equals("")) {
			return "admin/login";
		} else {
			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			Map<String, Object> cmap = new HashMap<String, Object>();
			/*if (u.getUtype().equals("管理员")) {
				pmap.put("uid", u.getUid());
				cmap.put("uid", u.getUid());
			}*/
			if (goods.getFid() != null && !goods.getFid().equals("")) {
				pmap.put("fid", goods.getFid());
				cmap.put("fid", goods.getFid());
			}
			if (goods.getName() != null && !goods.getName().equals("")) {
				pmap.put("name", goods.getName());
				cmap.put("name", goods.getName());
			}
			pmap.put("btype", "求租");
			cmap.put("btype", "求租");
			int total = goodsService.getCount(cmap);
			pageBean.setTotal(total);
			List<Goods> list = goodsService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("tlist", typeService.getAll(null));
			map.put("ulist", userService.getAll(null));
			session.setAttribute("p", 2);
			return "admin/goods_list_qz";
		}
	}

	
	
	/**
	 * 后台出售房屋的处理
	 * 
	 * @param file
	 * @param request
	 * @param img
	 * @return
	 */

	// 处理添加房屋的信息
	@RequestMapping("admin/doAddGoods_cs_admin.do")
	public String doAddGoods_cs_admin(ModelMap map, HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("auser");
		if (user == null) {
			return "admin/login";
		} else {
			map.put("tlist", typeService.getAll(null));
			return "admin/goods_add_cs";
		}
	}

	// 添加房屋信息
	@RequestMapping("admin/addGoods_cs_admin.do")
	public String addGoods_cs_admin(@RequestParam(value = "file", required = false) MultipartFile file, String img,
			HttpServletRequest request, Goods Goods, HttpSession session) {
		System.out.println("ddddd");
		Sysuser u = (Sysuser) session.getAttribute("auser");
		System.out.println("u=-=" + u);
		if (u == null || u.equals("")) {
			return "admin/login";
		} else {
			img = fileUpload(file, request, img);
			if (img != null) {
				Goods.setImg(img);
			} else {
				Goods.setImg("zanwu.jpg");
			}
			Goods.setBtype("出售");
			Goods.setStatus("通过审核");
			java.sql.Timestamp time = new Timestamp(System.currentTimeMillis());
			Goods.setPubtime(time.toString().substring(0, 19));
			Goods.setUid(u.getUid() + "");
			goodsService.add(Goods);
			return "redirect:goodsList_cs.do";
		}
	}

	// 处理更新房屋的信息
	@RequestMapping("admin/doUpdateGoods_cs_admin.do")
	public String doUpdateGoods_cs_admin(ModelMap map, int id) {
		map.put("goods", goodsService.getById(id));
		map.put("tlist", typeService.getAll(null));
		return "admin/goods_update_cs";
	}

	// 处理更新房屋的信息
	@RequestMapping("admin/deleteGoods_cs_admin.do")
	public String deleteGoods_cs_admin(ModelMap map, int id) {
		goodsService.delete(id);
		return "redirect:goodsList_cs.do";
	}

	// 房屋推荐
	@RequestMapping("admin/doUpdateGoods_cs_tuiJian.do")
	public String doUpdateGoods_cs_tuiJian(ModelMap map, int id) {
		Goods goods = goodsService.getById(id);
		goods.setIscommend("推荐");
		goodsService.update(goods);
		return "redirect:goodsList_cs.do";
	}

	@RequestMapping("admin/updateGoods_cs_admin.do")
	public String updateGoods_cs_admin(@RequestParam(value = "file", required = false) MultipartFile file, String img,
			HttpServletRequest request, Goods Goods) {
		img = fileUpload(file, request, img);
		if (img != null && !img.equals("zanwu.jpg")) {
			Goods.setImg(img);
		}
		goodsService.update(Goods);
		return "redirect:goodsList_cs.do";
	}

	// 分页查询--显示所有的房屋信息
	@RequestMapping("admin/goodsList_cs.do")
	public String goodsList_cs(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("auser");
		System.out.println("u=-=" + u);
		if (u == null || u.equals("")) {
			return "admin/login";
		} else {
			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			Map<String, Object> cmap = new HashMap<String, Object>();
			/*if (u.getUtype().equals("管理员")) {
				pmap.put("uid", u.getUid());
				cmap.put("uid", u.getUid());
			}*/
			pmap.put("btype", "出售");
			cmap.put("btype", "出售");
			int total = goodsService.getCount(cmap);
			pageBean.setTotal(total);
			List<Goods> list = goodsService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("tlist", typeService.getAll(null));
			map.put("ulist", userService.getAll(null));
			session.setAttribute("p", 1);
			return "admin/goods_list_cs";
		}
	}

	// 分页查询--查询所有的房屋信息
	@RequestMapping("admin/goodsList_cs_search.do")
	public String goodsList_cs_search(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods goods) {
		Sysuser u = (Sysuser) session.getAttribute("auser");
		System.out.println("u=-=" + u);
		if (u == null || u.equals("")) {
			return "admin/login";
		} else {
			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			Map<String, Object> cmap = new HashMap<String, Object>();
			/*if (u.getUtype().equals("管理员")) {
				pmap.put("uid", u.getUid());
				cmap.put("uid", u.getUid());
			}*/
			if (goods.getFid() != null && !goods.getFid().equals("")) {
				pmap.put("fid", goods.getFid());
				cmap.put("fid", goods.getFid());
			}
			if (goods.getName() != null && !goods.getName().equals("")) {
				pmap.put("name", goods.getName());
				cmap.put("name", goods.getName());
			}
			pmap.put("btype", "出售");
			cmap.put("btype", "出售");
			int total = goodsService.getCount(cmap);
			pageBean.setTotal(total);
			List<Goods> list = goodsService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("tlist", typeService.getAll(null));
			map.put("ulist", userService.getAll(null));
			session.setAttribute("p", 2);
			return "admin/goods_list_cs";
		}
	}
	// 文件上传
	public String fileUpload(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, String img) {
		String path = request.getSession().getServletContext().getRealPath("upload");
		String fileName = file.getOriginalFilename();
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
			img = "zanwu.jpg";
		}
		return img;

	}
}

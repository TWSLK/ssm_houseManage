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
import com.entity.News;
import com.server.FtypeServer;
import com.server.GoodsServer;
import com.server.KeepServer;
import com.server.NewsServer;
import com.server.SysuserServier;
import com.util.PageBean;

@Controller
public class NewsController {
	@Resource
	private NewsServer newsService;
	@Resource
	private KeepServer ForderService;
	@Resource 
	private SysuserServier userService;
	@Resource
	private GoodsServer goodsService;
	@Resource
	private  FtypeServer typeService;
	
	
	
//	首页显示内容
	@RequestMapping("index.do")
	public String showIndex(ModelMap map){
		Map<String, Object> pmap=new HashMap<String,Object>();
		Map<String, Object> pmap2=new HashMap<String,Object>();
		Map<String, Object> jzmap=new HashMap<String,Object>();
		Map<String, Object> jzmap2=new HashMap<String,Object>();
		Map<String, Object> sbmap=new HashMap<String,Object>();
		pmap.put("pageno", 0);
		pmap.put("pageSize", 4);
		/*pmap.put("gtype", "新闻动态");*/
		
		pmap2.put("pageno", 1);
		pmap2.put("pageSize", 6);
		/*pmap2.put("gtype", "新闻动态");*/
		
		jzmap.put("pageno", 0);
		jzmap.put("pageSize", 10);
		jzmap.put("btype", "出租");
		
		jzmap2.put("pageno", 0);
		jzmap2.put("pageSize", 10);
		jzmap2.put("btype", "求租");
		
		
		List<News> list=newsService.getByPage(pmap);
		
		List<News> list2=newsService.getByPage(pmap2);
		
		List<News> sblist=newsService.getByPage(sbmap);
		
	/*	List<Sysuser> ulist=userService.getByPage(jzmap);*/
		
		List<Goods> clist=goodsService.getAll(jzmap);
		List<Goods> clist2=goodsService.getAll(jzmap2);
	    List<Ftype> tlist=typeService.getAll(null);
	   
	    map.put("sblist", sblist);
		map.put("list", list);
		map.put("list2", list2);
		map.put("glist", clist);
		map.put("glist2", clist2);
		/*map.put("yplist", yplist);*/
		map.put("tlist", tlist);

		return "index2";
	}

	
	
	
	
	//news.do 新闻动态
//	分页
	@RequestMapping("news.do")
	public String news(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap=new HashMap<String,Object>();
		cmap.put("gtype", "新闻动态");
		pmap.put("gtype", "新闻动态");
		int total=newsService.getCount(cmap);
		System.out.println("total==="+total);
		pageBean.setTotal(total);
		List<News> list=newsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
		session.setAttribute("p", 1);
		return "newlist";
	}
	
	//搜索查询新闻动态searchNews.do
	@RequestMapping("searchNews.do")
	public String searchNews(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,News news){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap=new HashMap<String,Object>();
		cmap.put("name", news.getName());
		pmap.put("name", news.getName());
		cmap.put("gtype", "新闻动态");
		pmap.put("gtype", "新闻动态");
		int total=newsService.getCount(cmap);
		System.out.println("total==="+total);
		pageBean.setTotal(total);
		List<News> list=newsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
		session.setAttribute("p", 1);
		session.setAttribute("p", 2);
		return "newlist";
	}
	
	
	//showNew.do--新闻动态
    @RequestMapping("showNew.do")
    public String showNews(ModelMap map,int id){
    	System.out.println("id==="+id);
    	map.put("news", newsService.getById(id));
    	List<Ftype> tlist = typeService.getAll(null);
		map.put("tlist", tlist);
    	return "newsx";
    }
    

    
	@RequestMapping("admin/doAddNews.do")
	public String doAddNews(ModelMap map){
		map.put("tlist", newsService.getAll(null));
		return "admin/add_news";
	}

	@RequestMapping("admin/addNews.do")
	public String addNews(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,News news,String img){
		System.out.println("====+=====");
		img=fileUpload(file, request, img);
		news.setGgpic(img);
		news.setGtype("新闻动态");
		Timestamp time=new Timestamp(System.currentTimeMillis());
		news.setPubtime(time.toString().substring(0,19));
		news.setIsdel("1");
		newsService.add(news);
		return "admin/success";
	}

	@RequestMapping("admin/doUpdateNews.do")
	public String doUpdateNews(ModelMap map,int id){
		map.put("news", newsService.getById(id));
		return "admin/update_news";
	}

	@RequestMapping("admin/updateNews.do")
	public String updateNews(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,News news,String img){
		img=fileUpload(file, request, img);
		news.setGgpic(img);
		newsService.update(news);
		return "admin/success";
	}
	

	

	
//	分页查询
	@RequestMapping("admin/newsList.do")
	public String goodList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap=new HashMap<String,Object>();
		cmap.put("gtype", "新闻动态");
		pmap.put("gtype", "新闻动态");
		int total=newsService.getCount(cmap);
		System.out.println("total==="+total);
		pageBean.setTotal(total);
		List<News> list=newsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "admin/list_news";
	}
	
//   分页模糊查询
	@RequestMapping("admin/vagueNewsList.do")
	public String vagueNewsList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		int total=newsService.getCount(null);
		pageBean.setTotal(total);
		List<News> list=newsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		return "admin/list_news";
	}
	@RequestMapping("admin/deleteNews.do")
	public String deleteNews(int id){
		newsService.delete(id);
		return "admin/success";
	}
	
//	文件上传
	public String fileUpload(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,String img){
		String path=request.getSession().getServletContext().getRealPath("upload");
		System.out.println("path==="+path);
		System.out.println("file==="+file);
		String fileName=file.getOriginalFilename();
		System.out.println("fileName==="+fileName);
		File targetFile=new File(path,fileName);
		if(!targetFile.exists()){
			targetFile.mkdirs();
		}
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String pa=request.getContextPath()+"/upload/"+fileName;
		System.out.println("path==="+pa);
		if(fileName!=null&&!fileName.equals("")){
			img=fileName;
		}else{
			img="zanwu.jpg";	
		}
		
		return img;
		
	}
}

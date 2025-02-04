package feature.order.controller;

import core.util.CommonUtil;
import feature.order.service.OrderService;
import feature.order.vo.ItemOrderVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/findAllOrder")
public class MemberOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CommonUtil commonUtil = new CommonUtil();
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


        doPost(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        Integer memNo = 1002; //memVo.getMemNo();

        List<ItemOrderVO> itemMemOrderVOS = new OrderService().selectFromMemNo(memNo);
        System.out.println(itemMemOrderVOS);
        commonUtil.writePojo2Json(res, itemMemOrderVOS);


    }

}

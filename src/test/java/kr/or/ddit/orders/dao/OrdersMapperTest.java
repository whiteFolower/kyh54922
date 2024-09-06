package kr.or.ddit.orders.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.vo.OrdersVO;
import kr.or.ddit.vo.ProdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class OrdersMapperTest {

	@Autowired
	OrdersMapper mapper;
	
	@Test
	void testDeleteByPrimaryKey() {
		fail("Not yet implemented");
	}

	@Test
	void testInsert() {
		 OrdersVO order = new OrdersVO();
	        
		 LocalDate day = LocalDate.now();
	        order.setOrderDate(day);
	        order.setOrderState("미승인");
	        order.setOrderPayment("신용카드");
	        order.setOrderQty(1);
	        order.setOrderPrice(1);
	        order.setOrderLgu("P101");
	        order.setOrderId("P101000001");
	        order.setOrderTurn("O001");;
	        order.setOrderBuyer("P10101");
	        order.setOrderTotal(1);
	        
	        System.out.println(order);
	}

	@Test
	void testSelectByPrimaryKey() {
		OrdersVO orders = mapper.selectByPrimaryKey("O101");
		log.info("조회 결과 : {}", orders);
	}

	@Test
	void testSelectAll() {
		assertDoesNotThrow(()->mapper.selectAll(null));
	}

	@Test
	void testUpdateByPrimaryKey() {
		fail("Not yet implemented");
	}
	
	@Test
	void selectOrder() {
		 OrdersVO order = new OrdersVO();
		 LocalDate day = LocalDate.now();
		   order.setOrderDate(day);
		  order.setOrderBuyer("P10101");
		   System.out.println(order);
	}

}

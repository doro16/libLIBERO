package com.libero.service.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class Buy {

	
	private int buyNo;
	private int buyAmount;
	private String deliveryRequest;
	private String paymentOption;
	private String deliveryStatus; //��� ���� 
	private String receiverName;
	private String receiverAddr;
	private String receiverPhone;
	private int actualPrice;
	private String buyStatus; //��ٱ��Ͽ� �ִ� ���� ���� �� ��ǰ���� �˸��� ����
	private String cancelReason;
	private User buyerId; // ȸ�� �̸� , ���̵�(�̸���) , ������ �ּ� , �޴��� ��ȣ
	private List<Product> prodNo; //������ ��ǰ ���� ==> ��ǰ �� , ��ǰ ���� , ���� / â���� �̸� , �Ѱ�������?(�մܿ��� �����´�?), ��ǰ �̹���,
								  //��ǰ Ÿ��.( ��ǰ Ÿ�Կ� ���� ����� �Է� â ��� ���� Ȯ��) 
								  //ī�װ� ?, �ؽ��±� ?.( ��踦 �� �� �ʿ�?)
								  // ����Ʈ -> �������� ��ǰ�� ���� �� �־ �ʿ� �ϴ� ����.
	private List<Publish> publish; //�μ�� �ֹ� ���� ,product �� �ش��ϴ� ��ǰ �ϳ��ϳ��� ���� �ޱ� �ʿ�� ���� ����Ʈ ���.�³�?
	private Date regDate;
	
	
	
	
}

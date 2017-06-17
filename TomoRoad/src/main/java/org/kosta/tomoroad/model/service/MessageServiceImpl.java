package org.kosta.tomoroad.model.service;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.MessageDAO;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService{
	@Resource(name="messageDAOImpl")
	private MessageDAO messageDAO;

}

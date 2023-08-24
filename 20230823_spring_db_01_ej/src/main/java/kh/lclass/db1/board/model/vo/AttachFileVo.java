package kh.lclass.db1.board.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class AttachFileVo {
	private int bno;
	private String filepath;
	private String fileno;

}

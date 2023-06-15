package kh.lclass.openapi.run;

import kh.lclass.openapi.controller.EvInfoController;

public class EvInfoRun {
	public static void main(String[] args) {
		EvInfoController evInfoCtrl = new EvInfoController();
		evInfoCtrl.getEvIfoAll();
	}
}

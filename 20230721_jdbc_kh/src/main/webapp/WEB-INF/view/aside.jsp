<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <aside>
<!-- 
    <input type="button" value="a" onclick="a();">
    <input type="button" value="b">
 -->
                <input type="radio" name="tab" id="first" checked>
                <input type="radio" name="tab" id="second">
                <div class="labels">
                    <label for="first" id="test1">Firsts</label>
                    <label for="second" id="test2">Seconds</label>
                </div>
                <div class="items">
                    <div class="tab-item">
                        <ul>
                            <li>
                                <div class="thumnail">
                                    <a href="#">
                                        <img src="${pageContext.request.contextPath }/resources/images/ryan.svg" height="45" width="45">
                                    </a>
                                </div>
                                <div class="descript">
                                    <a href="#">
                                        <p>HTML5 Canvasssssss</p>
                                        <p>2023-03-08</p>
                                    </a>
                                </div>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="thumnail">
                                        <img src="https://dummyimage.com/45/ccc">
                                    </div>
                                    <div class="descript">
                                        <p>HTML5 Semantics Web</p>
                                        <p>2023-03-08</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="thumnail">
                                        <img src="https://dummyimage.com/45/ccc">
                                    </div>
                                    <div class="descript">
                                        <p>HTML5 Audio</p>
                                        <p>2023-03-08</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="thumnail">
                                        <img src="https://dummyimage.com/45/ccc">
                                    </div>
                                    <div class="descript">
                                        <p>HTML5 Video</p>
                                        <p>2023-03-08</p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-item">
                        <ul>
                            <li>Semantic</li>
                            <li>Transition</li>
                            <li>...</li>
                            <li>...</li>
                        </ul>
                    </div>
                </div>
            </aside>
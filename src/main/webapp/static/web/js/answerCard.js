// 答题卡
var global_width = 630;
var global_height = 850;
var global_x = 50;
var global_y = 30;
var consume_height = 0; // 已消耗高度
var is_change_paper = false; // 是否换页
var page = 1; // 页码
var max_height = global_height;
var current_height = 0; // 当前高度
var answerIndex = 1; //题号索引

// 选择题
var choice_width = 50;
var choice_height = 30;
var choice_line_count = 10; // 每行总数

// 填空题
var fill_interval = 10; // 答案间隔

// 简答题
var answer_width = 550;
var answer_height = 200;

var coordinate_arr = new Array(); // 所有坐标

// 遍历arr生成对应简答题
function answerBox(count) {
	for (var i = 0; i < count; i++) {
		var index = i + 1;
		var temp = false;
		if (index == 1)
			temp = true;
		var residue_height = max_height - consume_height;
		if (residue_height < (answer_height * 2)) {
			getChange();
			temp = true;
		}
		var dy_y = temp ? getHeight() : getHeight(answer_height);
		var dy_x = getWidth();
		zr.add(txt(dy_x, dy_y, 14, questionIndex + '.'));
		saveCoordinate(3, dy_x + 10, dy_y, answer_width, answer_height, answerIndex);
		questionIndex++;
	}
}

// 遍历map生成对应填空题(key: 填空格数，value: 答案长度数组)
function fillLine(fill_map) {
	var arr = fill_map.keys();
	for (var i = 0; i < arr.length; i++) {
		drawLine(questionIndex, arr[i], fill_map.get(arr[i]), answerIndex);
		questionIndex++;
	}
}

// 根据编号, 答案数量，答案长度生成填空题
function drawLine(index, count, arrSize,questionIndex) {
	var value_y = getHeight(50);
	var dy_x = getWidth();
	var temp = dy_x; // 记录当前位置
	zr.add(txt(dy_x - 10, value_y - 5, 14, index + '.'));
	for (var i = 0; i < count; i++) {
		if ((temp + (arrSize[i] * 10)) >= global_width) { // 判断是否超过宽度
			value_y = getHeight(50);
			dy_x = getWidth();
			temp = dy_x;
		}
		zr.add(line(dy_x, value_y, arrSize[i] * 10));
		saveCoordinate(2, dy_x, value_y - 40, arrSize[i] * 10, 50, answerIndex);
		dy_x = dy_x + arrSize[i] * 10 + fill_interval;
		temp = dy_x;
	}
}

// 根据数量生成对应选择题
function choiceRect(count, temp) {debugger;
	var title_y = getHeight();
	var value_y = getHeight();
	var dy_x = getWidth();
	if (temp == null)
		temp = 0;
	for (var i = 0; i < count; i++) {
		if (i >= choice_line_count) { // 判断是否超过每行总数
			var index = count - choice_line_count;
			temp = temp + choice_line_count;
			choiceRect(index, temp); // 递归
			break;
		}
		zr.add(rect(dy_x, title_y, choice_width, choice_height, temp + i + 1));
		zr.add(rect(dy_x, value_y, choice_width, choice_height));
		saveCoordinate(1, dy_x, value_y, choice_width, choice_height, answerIndex);
		questionIndex++;
		dy_x = dy_x + choice_width;
	}
}

// 计算宽度(宽度左右变换，不会增大)
function getWidth(value) {
	if (value == null) {
		value = global_x;
	}
	if (is_change_paper) {
		if (page % 2 == 0) {
			global_x = global_x + global_width;
			global_width = global_width * 2;
		} else {
			global_width = global_width / 2;
			global_x = global_x - global_width;
		}
		value = global_x;
		is_change_paper = false;
	}
	return value;
}

// 计算高度(高度左右变换，不断增大)
function getHeight(value) {
	if (value == null) {
		value = global_y;
	}
	consume_height = consume_height + value;
	if (consume_height >= max_height) {
		page = page + 1;
		if (page % 2 > 0) { // 奇数需要转换最大值
			max_height = max_height + global_height;
			current_height = current_height + global_height;
		}
		consume_height = current_height + value;
		is_change_paper = true;
	}
	return consume_height;
}

// 换页
function getChange() {
	page = page + 1;
	if (page % 2 > 0) { // 奇数需要转换最大值
		max_height = max_height + global_height;
		current_height = current_height + global_height;
	}
	consume_height = current_height;
	is_change_paper = true;
}

// 直线(横向)
function line(x, y, size) {
	return new zrender.Line({
		shape : {
			x1 : x,
			y1 : y,
			x2 : x + size,
			y2 : y
		}
	});
}

// 文字
function txt(x, y, size, val, color) {
	if (color == null)
		color = '#333'
	return new zrender.Text({
		style : {
			text : val,
			fontSize : size,
			fontFamily : 'system-ui',
			textAlign : 'center',
			textVerticalAlign : 'middle',
			textFill : color
		},
		position : [ x, y ]
	});
}

// 矩形
function rect(x, y, width, height, text, size, txtColor, boxColor) {
	if (boxColor == null)
		boxColor = '#000000'
	if (txtColor == null)
		txtColor = '#333'
	return new zrender.Rect({
		shape : {
			x : x,
			y : y,
			width : width,
			height : height
		},
		style : {
			fill : 'transparent',
			stroke : boxColor,
			fontSize : size,
			text : text,
			textFill : txtColor,
			fontFamily : 'system-ui'
		}
	});
}

// 保存答案坐标
function saveCoordinate(type, x, y, width, height, answerIndex, score, paperId, questionId, examId, subjectId) {
	var coordinate = {
		"type" : type,
		"pointX" : x,
		"pointY" : y,
		"pointWidth" : width,
		"pointHeight" : height,
		"answerIndex" : answerIndex,
		"score" : score,
		"paperId" : paperId,
		"questionId" : questionId,
		"examId" : examId,
		"subjectId" : subjectId
	};
	coordinate_arr.push(coordinate);
	return coordinate;
}
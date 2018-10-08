$.fn.extend({
	selectTree : function() {
		return this.each(function() {
			var $this = $(this);
			var selectId = $this.attr("selectId");
			var url = unescape($this.attr("dataUrl")).replaceTmById();

			$.ajax({
				type : 'GET',
				url : url,
				cache : false,
				success : function(response) {
					var json = NUI.jsonEval(response);
					var ts = new TreeSelector($this, json, -1);
					ts.createTree();
					$this.val(selectId);
				}
			});
		});
	}
});



function TreeSelector(item, data, rootId) {
	this._item = item;
	this._data = data;
	this._rootId = rootId;
}
TreeSelector.prototype.createTree = function() {
	var len = this._data.length;
	for (var i = 0; i < len; i++) {
		if (this._data[i].pid == this._rootId) {
			this._item.append("<option value='"+this._data[i].id+"'>"+this._data[i].text+"</option>"); 
			for (var j = 0; j < len; j++) {
				this.createSubOption(len, this._data[i], this._data[j]);
			}
		}
	}
}
TreeSelector.prototype.createSubOption = function(len, current, next) {
	var blank = "..";
	if (next.pid == current.id) {
		intLevel = 0;
		var intlvl = this.getLevel(this._data, this._rootId, current);
		for (a = 0; a < intlvl; a++)
			blank += "..";
		blank += "├";
		this._item.append("<option value='"+next.id+"'>"+blank+next.text+"</option>"); 
		for (var j = 0; j < len; j++) {
			this.createSubOption(len, next, this._data[j]);
		}
	}
}
TreeSelector.prototype.getLevel = function(datasources, topId, currentitem) {
	var pid = currentitem.pid;
	if (pid != topId) {
		for (var i = 0; i < datasources.length; i++) {
			if (datasources[i].id == pid) {
				intLevel++;
				this.getLevel(datasources, topId, datasources[i]);
			}
		}
	}
	return intLevel;
}
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="UTF-8">
    <title>多层控制控件|室内三维地图引擎|ESmap</title>
    <meta name="keywords" content="多层控制控件,室内地图,三维地图引擎,三维地图制作,室内定位,易景地图,ESMap" />
	  <meta name="description" content="多层控制控件,易景室内三维地图引擎提供地图浏览、缩放、旋转、图层显隐等基础功能，支持自定义室内地图显示风格及样式，可自动绘制楼层热力图、散点图等专题地图，快速进行空间大数据分析展示。支持跨楼层精准的点到点之间的最短、最优路径计算，支持对路径结果进行导航和动画,并提供丰富的地图主题资源供二次开发调用。"/>
    <link href='lib/bootstrap.min.css' rel="stylesheet">
    <link href="css/common.css" rel="stylesheet">
    <link href="css/iconfont/iconfont.css" rel="stylesheet">
</head>

<body>
    <div id="map-container"></div>
    <script src="lib/esmap.min.js"></script>
    <script src="lib/jquery-2.1.4.min.js"></script>
    <script src="lib/bootstrap.min.js"></script>
    <script type="text/javascript">
        //定义全局map变量
        var esmapID = 'hmwyxx1';
        var floorControl;
        $(function () {
            //楼层控制控件配置参数
            var ctlOpt = new esmap.ESControlOptions({
                position: esmap.ESControlPositon.RIGHT_TOP
                , imgURL: "image/wedgets/"
            });
            map = new esmap.ESMap({
                container: $('#map-container')[0], //渲染dom
                mapDataSrc: 'data', //地图数据位置
                mapThemeSrc:"data/theme", //主题数据位置
            		focusAlphaMode: true,              //对不可见图层启用透明设置 默认为true
              	focusAnimateMode: true,            //开启聚焦层切换的动画显示
              	focusAlpha:0.98,                     //对不聚焦图层启用透明设置，当focusAlphaMode = true时有效  
            		modelLines:false,
            		token:'hmwyxx1',	    //配置成您的地图token              
                visibleFloors:"all"
            });
            //打开地图数据
            map.openMapById(esmapID); //sceneId
            map.on('loadComplete', function () {
                //创建楼层控件
                floorControl = new esmap.ESScrollFloorsControl(map, ctlOpt);
            });
            map.showCompass = false;     //显示指南针  
            
            // 点击事件
            map.on('mapClickNode', function(event) {
              console.log(event);
              if (event.nodeType == esmap.ESNodeType.NONE || event.nodeType == esmap.ESNodeType.FLOOR) return;
              var model = event;
      //      if (!startPick) return;
              if(event.nodeType != esmap.ESNodeType.MODEL) 
                  model.o3d_.flash({
                          scale: 1.3,
                          time: 0.3
                      }); //闪烁
              switch (event.nodeType) {
                  case esmap.ESNodeType.MODEL:        //返回房间信息                                            
                      map.storeSelect(model);//高亮
                      break; 
                  case esmap.ESNodeType.TEXT_MARKER:  //返回文字POI信息
                      break; 
                  case esmap.ESNodeType.FACILITY:     //返回图片POI信息
                      break;
                  case esmap.ESNodeType.IMAGE_MARKER:  //返回自写定义的图片信息
                      break;
                  case esmap.ESNodeType.MODEL3D:      //返回三维模型信息
                      break;
                  case esmap.ESNodeType.LINE:         //返回线信息
                      break;
              }
          })
        });
    </script>
</body>

</html>
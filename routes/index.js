
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('main', {"title": 'Express', "joblist": ['开发工程师', "测试工程师"]});
};


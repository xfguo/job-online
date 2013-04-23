
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('job', { title: 'Express' });
};


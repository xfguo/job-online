#
# * GET home page.
# 
exports.index = (req, res) ->
  res.render "main",
    title: "Job-online"
    joblist: ["嵌入式软件攻城狮", "件开发攻城狮", "SoC平台开发攻城狮"]

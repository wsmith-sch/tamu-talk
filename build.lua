module = "tamu-talk"

typesetexe   = "lualatex"
typesetfiles = {"tamu-talk-doc.tex", "tamu-talk-code.tex", "tamu-talk-example.tex"}
textfiles    = {"README.md", "CHANGELOG.md", "LICENSE"}

-- not needed apparently:
packtdszip = false

tagfiles = {"tamu-talk.dtx", "tamu-talk-doc.tex", "CHANGELOG.md"}

function update_tag(file, content, tagname, tagdate)
  local iso    = "%d%d%d%d%-%d%d%-%d%d"
  local semver = "%d+%.%d+%.%d+"
  if file ~= "CHANGELOG.md" then
    content = content
      :gsub("{" .. iso .. "}\n  {" .. semver .. "}",
        "{" .. tagdate .. "}\n  {" .. tagname .. "}")
      :gsub("%[" .. iso .. " v" .. semver, "[" .. tagdate .. " v" .. tagname)
      :gsub("Released " .. iso .. " %(v" .. semver .. "%)",
        "Released " .. tagdate .. " (v" .. tagname .. ")")
  elseif not content:find("## [" .. tagname .. "]", 1, true) then
    content = content:gsub("## %[Unreleased%]",
      "## [Unreleased]\n\n## [" .. tagname .. "] - " .. tagdate)
  end
  return content
end

uploadconfig = {
  pkg        = "tamu-talk",
  author     = "Wyatt Smith",
  email      = "216wsmith@gmail.com",
  uploader   = "Wyatt Smith",
  license    = "lppl1.3c",
  summary    = "An independently maintained Texas A&M theme for ltx-talk",
  ctanPath   = "/macros/latex/contrib/tamu-talk",
  repository = "https://github.com/wsmith-sch/tamu-talk",
  bugtracker = "https://github.com/wsmith-sch/tamu-talk/issues",
  topic      = {"presentation"},
}

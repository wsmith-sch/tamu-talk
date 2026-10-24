-- Build script for tamu-talk (see `l3build --help`)

module = "tamu-talk"

typesetexe   = "lualatex"
typesetfiles = {"tamu-talk-doc.tex", "tamu-talk-code.tex", "tamu-talk-example.tex"}
textfiles    = {"README.md", "CHANGELOG.md", "LICENSE"}

packtdszip = true

-- `l3build tag X.Y.Z` stamps the version and today's date into the sources
-- and the user guide, and starts a changelog section for it
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

-- `l3build upload` sends the CTAN zip with these details
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
  update     = false,
  note       = "The Texas A&M logo is intentionally not included (trademark). "
    .. "The package works without it and documents how users obtain it, "
    .. "the same approach as tuda-ci.",
}

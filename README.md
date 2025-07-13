# gordyt.github.io — Source branch

This branch contains the **source files** for [blog.gordontillman.info](https://blog.gordontillman.info/).

## 📑 Structure
- `source/blog/` — Org-mode blog posts
- `source/hugo-site/` — Hugo site directory (with `config.toml`, theme, etc.)

## 📝 Writing a new blog post

Blog posts are written in **Org-mode** and exported to Hugo-compatible Markdown via [ox-hugo](https://ox-hugo.scripter.co/).

### 📦 Emacs setup
Make sure you have the `ox-hugo` package installed in Emacs:
```elisp
(use-package ox-hugo
  :ensure t)
```

Or install via:
```
M-x package-install RET ox-hugo RET
```

### 🧩 Yasnippet helper
For convenience, we use a `yasnippet` in `org-mode` to scaffold a new blog post.  
Type the snippet key (e.g. `blog`) and expand it to pre-fill the header fields for ox-hugo.

Sample snippet:
```
#+TITLE: ${1:Your Post Title}
#+DATE: ${2:`(format-time-string "%Y-%m-%d")`}
#+HUGO_BASE_DIR: ../hugo-site/
#+HUGO_SECTION: posts
#+HUGO_TAGS: ${3:tag1, tag2}
#+HUGO_CATEGORIES: ${4:category}

$0
```

You can drop this snippet into your `~/.emacs.d/snippets/org-mode/` directory.

### 📆 Filename convention
We follow a date-prefixed naming convention for all posts:
```
YYYY-MM-DD-title.org
```

Example:
```
2025-07-11-hugo-is-working.org
```

This keeps posts sorted chronologically and easy to navigate.

### ✍️ Steps to create a new post
1️⃣ In `source/blog/`, create a new `.org` file with today’s date and slug in the filename:
```
2025-07-11-my-new-post.org
```

2️⃣ Use the `yasnippet` to fill in the header fields.

3️⃣ Write your content below the header.

4️⃣ Export to Markdown with:
```
M-x org-hugo-export-to-md
```

✅ This generates the corresponding `.md` file in `source/hugo-site/content/posts/`.

---

## 🚀 Publishing the site
Switch to the `master` branch and run:
```
make publish
```

✅ This cleans the working tree, fetches the Hugo build artifacts, and pushes to GitHub Pages.

---

For more details, see the `Makefile` in the `master` branch.

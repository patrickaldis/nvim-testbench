# Markdown Showcase Document

> **Purpose:** This document is a grab-bag of common (and a few less-common) Markdown features, meant to demonstrate syntax, layout, and formatting options.

---

## Table of Contents

- [Text styles](#text-styles)
- [Lists](#lists)
- [Links & images](#links--images)
- [Code](#code)
- [Tables](#tables)
- [Blockquotes](#blockquotes)
- [Task lists](#task-lists)
- [Footnotes](#footnotes)
- [Collapsible sections (HTML)](#collapsible-sections-html)
- [Math (renderer-dependent)](#math-renderer-dependent)
- [Horizontal rules](#horizontal-rules)
- [Escaping characters](#escaping-characters)

---

## Text styles

Plain text looks like this.

**Bold**, *italic*, ***bold+italic***, ~~strikethrough~~, and `inline code`.

Subscript and superscript aren’t standard Markdown, but some renderers support HTML:
H<sub>2</sub>O and 2<sup>10</sup>.

A line break can be forced with two spaces at the end of a line.  
Like this.

### Headings

# H1
## H2
### H3
#### H4
##### H5
###### H6

---

## Lists

### Unordered list

- Item A
- Item B
  - Nested B.1
  - Nested B.2
    - Nested B.2.a

### Ordered list

1. Step one
2. Step two
3. Step three
   1. Step three-point-one
   2. Step three-point-two

### Mixed list

1. Pick a base:
   - Vanilla
   - Chocolate
2. Add toppings:
   - Nuts
   - Sprinkles

### Definition-like list (renderer-dependent)

Term 1
: Definition for term 1

Term 2
: Definition for term 2

---

## Links & images

### Links

- Inline link: [Markdown Guide](https://www.markdownguide.org/)
- With title: [CommonMark](https://commonmark.org/ "CommonMark spec")
- Bare URL (autolink, renderer-dependent): https://example.com

### Images

![Alt text: a placeholder image](https://via.placeholder.com/640x200.png?text=Markdown+Image)

### Reference-style links

This uses a reference-style link to [a search engine][search].

[search]: https://duckduckgo.com/ "DuckDuckGo"

---

## Code

### Inline code

Use `git status` to see what changed.

### Fenced code blocks (language-highlighted)

```python
from dataclasses import dataclass

@dataclass
class User:
    name: str
    active: bool = True

print(User("Patrick"))

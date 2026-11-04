import markdown

with open('COMPLETE_SETUP_SUMMARY.md', 'r', encoding='utf-8') as f:
    md_content = f.read()

html_content = markdown.markdown(md_content)

with open('rendered_content.html', 'w', encoding='utf-8') as f:
    f.write(html_content)

print("Converted to rendered_content.html")
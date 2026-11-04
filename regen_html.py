import markdown
from pathlib import Path

md_path = Path('COMPLETE_SETUP_SUMMARY.md')
out_path = Path('static_rendered.html')

md_text = md_path.read_text(encoding='utf-8')
html_body = markdown.markdown(md_text, extensions=['fenced_code','tables','codehilite'])

html = f'''<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>COMPLETE_SETUP_SUMMARY - Rendered</title>
    <style>
      body {{ font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial; line-height:1.6; padding:24px; max-width:1000px; margin:0 auto; background:#f8fafc; color:#0f172a }}
      pre {{ padding:16px; border-radius:6px; overflow:auto; background:#f1f5f9; border:1px solid #e2e8f0 }}
      code {{ background:#f1f5f9; padding:2px 4px; border-radius:3px; font-family: 'Monaco', 'Menlo', 'Ubuntu Mono', monospace; font-size:0.9em }}
      img {{ max-width:100% }}
      .container {{ background: #fff; padding: 28px; border-radius: 8px; box-shadow: 0 6px 18px rgba(2,6,23,0.08) }}
      h1, h2, h3 {{ color:#1e293b }}
      ul {{ padding-left:20px }}
      blockquote {{ border-left:4px solid #e2e8f0; padding-left:16px; margin:16px 0; color:#64748b }}
    </style>
  </head>
  <body>
    <div class="container">
      {html_body}
    </div>
  </body>
</html>
'''

out_path.write_text(html, encoding='utf-8')
print(f'Wrote {out_path.resolve()}')

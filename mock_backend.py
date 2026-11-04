from flask import Flask, send_from_directory, jsonify
from pathlib import Path

app = Flask(__name__, static_folder='.')

@app.route('/')
def index():
    # Serve the static rendered HTML as the home page
    return send_from_directory('.', 'static_rendered.html')

@app.route('/api/health')
def health():
    return jsonify({
        'success': True,
        'message': 'Mock Backend running',
        'database': 'Mocked',
        'ai_enabled': False,
        'maps_configured': False
    })

@app.route('/<path:filename>')
def static_files(filename):
    p = Path('.')
    if (p / filename).exists():
        return send_from_directory('.', filename)
    return ('Not Found', 404)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=False)

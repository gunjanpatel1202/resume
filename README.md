# Gunjan Patel Resume Website

Single-page responsive resume website for Patel Gunjan Lakhandar (Staff Nurse).

## Project Structure

- `index.html` - Main resume page (all layout/styles/content in one file).
- `profile.jpeg` - Profile image shown in the header.

## Features

- Responsive resume layout for desktop and mobile.
- Professional card-based UI with clean typography.
- Print-friendly CSS for resume export/printing.
- Inline SVG favicon with letter `G`.

## Run Locally

This is a static HTML project. No build step is required.

1. Open `index.html` directly in a browser.
2. Or run any static file server from this folder.

Example using Python:

```bash
python3 -m http.server 8000
```

Then open: `http://localhost:8000`

## Customize

- Update content sections in `index.html`:
	- Summary
	- Experience
	- Education
	- Clinical Skills
	- Languages
	- Certificates
- Replace `profile.jpeg` if you want a different profile photo.
- Adjust colors and spacing using the CSS variables at the top of `index.html`.

## Notes

- Favicon is set inline in `index.html` (no external favicon files required).
- Keep `profile.jpeg` in the same directory as `index.html` unless you also update its `src` path.

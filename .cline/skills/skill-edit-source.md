# Cline Skill Edit Source

This markdown file contains the **skill‑edit source** for the quiz application.  It provides a self‑contained HTML editor that allows you to modify the questions (mondai) stored in `data_kanji.json` **without needing to run any Python HTTP server**.

---

## How to use the skill‑edit source

1. **Save the HTML below as a file** (e.g. `skill_edit.html`) in the same directory as `data_kanji.json`.
2. **Open the file in a web browser** (double‑click it or drag‑and‑drop it onto a browser window).  Because the file is opened via the `file://` protocol, the built‑in `fetch` API can read `data_kanji.json` directly – no local server is required.
3. The editor will load all kanji groups and their questions.  Each question appears in a `<textarea>` allowing you to edit the text (including any `<u>` tags).
4. After making your changes, click **"Download Edited JSON"**.  The browser will generate `data_kanji_edited.json` containing the updated structure.  You can then replace the original `data_kanji.json` with this file if you wish.

---

## Skill‑Edit HTML (copy‑paste this into a new file)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Skill Editor</title>
    <style>
        body {font-family: Arial, sans-serif; margin: 20px; background:#f7fafc;}
        h1 {color:#2d3748;}
        .kanji-group {margin-bottom:30px; padding:10px; background:#fff; border:1px solid #e2e8f0; border-radius:5px;}
        .group-title {font-weight:bold; margin-bottom:8px;}
        .question {margin:8px 0;}
        textarea {width:100%; height:60px; font-family:inherit;}
        button {margin-top:10px; padding:8px 12px; background:#667eea; color:#fff; border:none; border-radius:4px; cursor:pointer;}
    </style>
</head>
<body>
    <h1>Quiz Skill Editor</h1>
    <div id="editor">Loading…</div>
    <button id="downloadBtn">Download Edited JSON</button>

    <script>
        // Load the JSON file (works with file:// URLs in most browsers)
        fetch('data_kanji.json')
            .then(r => r.json())
            .then(data => {
                window._editedData = data; // keep reference for download
                renderEditor(data);
            })
            .catch(err => {
                document.getElementById('editor').innerText = 'Failed to load data_kanji.json';
                console.error(err);
            });

        function renderEditor(data) {
            const container = document.getElementById('editor');
            container.innerHTML = '';
            data.forEach((group, gIdx) => {
                const groupDiv = document.createElement('div');
                groupDiv.className = 'kanji-group';
                const title = document.createElement('div');
                title.className = 'group-title';
                title.textContent = group.kanji;
                groupDiv.appendChild(title);

                group.questions.forEach((q, qIdx) => {
                    const qDiv = document.createElement('div');
                    qDiv.className = 'question';
                    const label = document.createElement('label');
                    label.textContent = `Q${q.id}:`;
                    const textarea = document.createElement('textarea');
                    textarea.value = q.question;
                    textarea.oninput = e => {
                        window._editedData[gIdx].questions[qIdx].question = e.target.value;
                    };
                    qDiv.appendChild(label);
                    qDiv.appendChild(textarea);
                    groupDiv.appendChild(qDiv);
                });
                container.appendChild(groupDiv);
            });
        }

        document.getElementById('downloadBtn').addEventListener('click', () => {
            const dataStr = JSON.stringify(window._editedData, null, 2);
            const blob = new Blob([dataStr], {type: 'application/json'});
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = 'data_kanji_edited.json';
            a.click();
            URL.revokeObjectURL(url);
        });
    </script>
</body>
</html>
```

---

### Notes

* The editor **only modifies the question text**.  Options, answers, and IDs are left untouched, but you can extend the script if you need to edit those as well.
* Because no server is required, simply double‑click the generated `skill_edit.html` in your file explorer to launch it.
* After downloading the edited JSON, replace the existing `data_kanji.json` (or keep both files and point the quiz pages to the new one).

---

*This file is part of the Cline skill‑edit source and should be kept version‑controlled alongside the rest of the project.*

## Brief overview
Guidelines to restrict Cline’s automatic file scanning and generation to the **QuizJLPT** project folder only, minimizing unnecessary token usage and preventing unsolicited "auto‑thinking."

## Reading scope
- **Only** read files located inside the directory `QuizJLPT` (i.e., `/Users/nhanvo/Documents/04.AI/SringBoot/QuizJLPT`) when responding to a user prompt, unless the user explicitly requests a different location.
- Do **not** automatically traverse sibling directories or parent folders.
- If a request refers to a file outside `QuizJLPT`, ask the user for confirmation before accessing it.

## Auto‑reasoning suppression
- Do not perform unsolicited code analysis, speculation, or generation that the user has not asked for.
- Limit responses to the concrete task described in the prompt; avoid extra explanations unless the user asks for them.

## Token management
- Keep replies concise and focused on the requested action.
- Avoid pre‑emptive exploration of the repository unless it is required to fulfil the user’s explicit request.

## Implementation notes
- Treat each new user prompt as a fresh command scoped to the `QuizJLPT` folder.
- If additional context is needed beyond the current folder, request clarification from the user before proceeding.

## Other guidelines
- Maintain a clear, step‑by‑step checklist (`task_progress`) for any multi‑step operation.
- Respect the user’s preference for minimal token consumption by avoiding unnecessary background processing.
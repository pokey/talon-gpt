app: vscode
-
pilot jest: user.vscode("editor.action.inlineSuggest.trigger")
pilot yes word: user.vscode("editor.action.inlineSuggest.acceptNextWord")
pilot nope: user.vscode("editor.action.inlineSuggest.undo")
pilot cancel: user.vscode("editor.action.inlineSuggest.hide")
pilot block last: user.vscode("workbench.action.chat.previousCodeBlock")
pilot block next: user.vscode("workbench.action.chat.nextCodeBlock")
pilot new file <user.ordinal_or_last>:
    user.copilot_focus_code_block(ordinal_or_last)
    user.vscode("workbench.action.chat.insertIntoNewFile")
pilot copy <user.ordinal_or_last>:
    user.copilot_focus_code_block(ordinal_or_last)
    edit.copy()
pilot bring <user.ordinal_or_last>: user.copilot_bring_code_block(ordinal_or_last)
pilot bring <user.ordinal_or_last> {user.makeshift_destination} <user.cursorless_target>:
    user.cursorless_command(makeshift_destination, cursorless_target)
    user.copilot_bring_code_block(ordinal_or_last)
pilot chat [<user.prose>]$:
    user.copilot_chat(prose or "")
pilot edit [<user.prose>]$:
    user.copilot_edit(prose or "")
pilot edit make: user.vscode("workbench.action.chat.newEditSession")
pilot next: user.vscode("chatEditor.action.navigateNext")
pilot previous: user.vscode("chatEditor.action.navigatePrevious")
pilot yes: user.vscode("chatEditor.action.accept")
pilot {user.copilot_slash_command} <user.cursorless_target> [to <user.prose>]$:
    user.cursorless_command("setSelection", cursorless_target)
    user.copilot_inline_chat(copilot_slash_command or "", prose or "")
pilot make [<user.prose>]:
    user.copilot_inline_chat("", prose or "")
pilot add dock: user.vscode("github.copilot.edits.attachFile")
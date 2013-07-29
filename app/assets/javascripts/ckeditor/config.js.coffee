$ ->
  if $('body').find('#course_note').length > 0
    CKEDITOR.editorConfig = (config) ->
      config.format_tags = "p;h3;h4"
      config.toolbar_Simple = [
        { name: "document",     items: ["Source", "-", "Preview"] },
        { name: "basicstyles",  items: ["Bold", "Italic", "Underline", "Strike", "Subscript", "Superscript", "-", "RemoveFormat"] },
        { name: "styles",       items: ["Format"] },
        { name: "paragraph",    items: ["NumberedList", "BulletedList", "-", "Blockquote", "CreateDiv", "-", "JustifyLeft", "JustifyCenter", "JustifyRight", "JustifyBlock"] },
        { name: "links",        items: ["Link", "Unlink", "Anchor"] }
      ]
      config.toolbar = 'Simple'
      true

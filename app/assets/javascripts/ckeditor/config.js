if ($('body').find('#course_note').length > 0) {
  CKEDITOR.replace('course_note', {
    format_tags: 'p;h3;h4',
    toolbar: [
      { name: 'document', items: ['Source', '-', 'Preview'] },
      { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat'] },
      { name: 'styles', items: ['Format'] },
      { name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'] },
      { name: 'links', items: ['Link', 'Unlink', 'Anchor'] }
    ]
  });

  CKEDITOR.replace('course_program', {
    format_tags: 'p;h3;h4',
    toolbar: [
      { name: 'document', items: ['Source', '-', 'Preview'] },
      { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat'] },
      { name: 'styles', items: ['Format'] },
      { name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'] },
      { name: 'links', items: ['Link', 'Unlink', 'Anchor'] }
    ]
  });
}

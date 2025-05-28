from django.contrib import admin

from .models import Comment

@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    list_display = ['date_comment', 'user_moodle', 'comment']
    readonly_fields = ['date_comment', 'user_moodle', 'comment']
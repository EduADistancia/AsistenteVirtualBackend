from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.utils.translation import gettext_lazy as _
from .models import User


@admin.register(User)
class UserAdmin(BaseUserAdmin):
    model = User
    list_display = ('email', 'name', 'last_name', 'is_staff', 'is_superuser')
    list_filter = ('is_staff', 'is_superuser')
    search_fields = ('email', 'name', 'last_name')
    ordering = ('email',)
    readonly_fields = ('date_created',)

    # Campos visibles en el formulario
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        (_('Información personal'), {'fields': ('name', 'last_name')}),
        (_('Permisos'), {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        (_('Fechas'), {'fields': ('date_created',)}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'name', 'last_name', 'password1', 'password2', 'is_staff', 'is_superuser'),
        }),
    )

    def has_change_permission(self, request, obj=None):
        # Superusers pueden cambiar todo
        if request.user.is_superuser:
            return True
        # Usuarios staff pueden editar solo su propio perfil
        if obj is None:
            return True  # Para que puedan acceder a la vista de lista
        return obj == request.user

    def has_delete_permission(self, request, obj=None):
        # Sólo los superusers pueden eliminar usuarios
        return request.user.is_superuser

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        # Si es superuser, ve todos; si no, ve sólo su propio usuario
        if request.user.is_superuser:
            return qs
        return qs.filter(pk=request.user.pk)

    def get_readonly_fields(self, request, obj=None):
        # Si es superuser, todo editable; si no, no puede tocar permisos
        if request.user.is_superuser:
            return self.readonly_fields
        return self.readonly_fields + ('is_staff', 'is_superuser', 'groups', 'user_permissions')
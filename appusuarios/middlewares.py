from django.shortcuts import redirect
from django.urls import reverse

    
class ForcePasswordChangeMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        if (
            request.user.is_authenticated
            and request.user.is_staff
            and getattr(request.user, "must_change_password", False)
        ):
            change_url = reverse("admin:user_password_change")
            if request.path != change_url:
                return redirect(change_url)
        return self.get_response(request)

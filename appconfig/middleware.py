from corsheaders.middleware import CorsMiddleware
from django.utils.deprecation import MiddlewareMixin
from .models import AllowedOriginCORS

class DynamicCorsMiddleware(CorsMiddleware, MiddlewareMixin):
    def process_request(self, request):
        self.origin_whitelist = set(AllowedOriginCORS.objects.values_list('origin', flat=True))
        return super().process_request(request)

from room.serializers import RoomOrderLineSerializer
from django.contrib import admin
from room.models import Message, Room, RoomUser,RoomWishlistProduct,WishlistProductVote,RoomOrder, RoomOrderLine, UserOrderLine, OrderEvent,Invoice, Message
import nested_admin


class RoomUserInline(nested_admin.NestedTabularInline):
    model = RoomUser
    extra = 0


class RoomWishlistInline(nested_admin.NestedTabularInline):
    model = RoomWishlistProduct
    extra = 0


class RoomAdmin(nested_admin.NestedModelAdmin):
    inlines = [RoomUserInline, RoomWishlistInline]
    list_display = [
                    'id',
                    'name',
                    'title',
                    'created_at',
                    'deleted_at',
                    ]
    list_editable = [
                    ]
    list_display_links = [
                    'id',
                    'name',
                    'title',
                    ]
    list_filter = [

                    ]
    search_fields = [
                    'name',
                    'title',
                    'description',
                    ]


admin.site.register(Room, RoomAdmin)
admin.site.register(RoomUser)
admin.site.register(RoomWishlistProduct)
admin.site.register(WishlistProductVote)
admin.site.register(RoomOrder)
admin.site.register(RoomOrderLine)
admin.site.register(UserOrderLine)
admin.site.register(OrderEvent)
admin.site.register(Invoice)
admin.site.register(Message)

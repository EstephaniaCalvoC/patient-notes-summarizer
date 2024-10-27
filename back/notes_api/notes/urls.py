from django.urls import path
from .views import get_notes_summary

urlpatterns = [
    path('summary/<int:patient_id>', get_notes_summary, name='notes-summary')
]

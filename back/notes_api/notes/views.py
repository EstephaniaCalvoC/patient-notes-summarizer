from rest_framework.response import Response
from rest_framework.decorators import api_view


def summarize_notes(patient_id):
    return "Summary of notes for patient " + str(patient_id)

@api_view(['GET'])
def get_notes_summary(request, patient_id):
    summary = summarize_notes(patient_id)
    return Response({'patient_id': patient_id, 'summary': summary})

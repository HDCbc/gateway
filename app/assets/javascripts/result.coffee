# =require core.coffee
###*
Observations generated by laboratories, imaging procedures, and other procedures. The scope
includes hematology, chemistry, serology, virology, toxicology, microbiology, plain x-ray,
ultrasound, CT, MRI, angiography, cardiac echo, nuclear medicine, pathology, and procedure
observations.
@class
@augments CodedEntry
###
class Result extends CodedEntry
  ###*
  A status from the HL7 ActStatusNormal vocabulary
  @returns {String}
  ###
  status: -> @json['status']

  ###*
  Returns the value of the result. This will return an object. The properties of this
  object are dependent on the type of result.
  ###
  value: -> @json['value']

  ###*
  @returns {CodedValue}
  ###
  interpretation: -> new CodedValue @json['interpretation'].codeSystem, @json['interpretation'].code
  
  ###*
  @returns {String}
  ###
  referenceRange: -> @json['referenceRange']
  
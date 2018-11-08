# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


module Google
  module Cloud
    module Vision
      module V1p3beta1
        # The type of Google Cloud Vision API detection to perform, and the maximum
        # number of results to return for that type. Multiple `Feature` objects can
        # be specified in the `features` list.
        # @!attribute [rw] type
        #   @return [Google::Cloud::Vision::V1p3beta1::Feature::Type]
        #     The feature type.
        # @!attribute [rw] max_results
        #   @return [Integer]
        #     Maximum number of results of this type. Does not apply to
        #     `TEXT_DETECTION`, `DOCUMENT_TEXT_DETECTION`, or `CROP_HINTS`.
        # @!attribute [rw] model
        #   @return [String]
        #     Model to use for the feature.
        #     Supported values: "builtin/stable" (the default if unset) and
        #     "builtin/latest".
        class Feature
          # Type of Google Cloud Vision API feature to be extracted.
          module Type
            # Unspecified feature type.
            TYPE_UNSPECIFIED = 0

            # Run face detection.
            FACE_DETECTION = 1

            # Run landmark detection.
            LANDMARK_DETECTION = 2

            # Run logo detection.
            LOGO_DETECTION = 3

            # Run label detection.
            LABEL_DETECTION = 4

            # Run text detection / optical character recognition (OCR). Text detection
            # is optimized for areas of text within a larger image; if the image is
            # a document, use `DOCUMENT_TEXT_DETECTION` instead.
            TEXT_DETECTION = 5

            # Run dense text document OCR. Takes precedence when both
            # `DOCUMENT_TEXT_DETECTION` and `TEXT_DETECTION` are present.
            DOCUMENT_TEXT_DETECTION = 11

            # Run Safe Search to detect potentially unsafe
            # or undesirable content.
            SAFE_SEARCH_DETECTION = 6

            # Compute a set of image properties, such as the
            # image's dominant colors.
            IMAGE_PROPERTIES = 7

            # Run crop hints.
            CROP_HINTS = 9

            # Run web detection.
            WEB_DETECTION = 10

            # Run Product Search.
            PRODUCT_SEARCH = 12

            # Run localizer for object detection.
            OBJECT_LOCALIZATION = 19
          end
        end

        # External image source (Google Cloud Storage or web URL image location).
        # @!attribute [rw] gcs_image_uri
        #   @return [String]
        #     **Use `image_uri` instead.**
        #
        #     The Google Cloud Storage  URI of the form
        #     `gs://bucket_name/object_name`. Object versioning is not supported. See
        #     [Google Cloud Storage Request
        #     URIs](https://cloud.google.com/storage/docs/reference-uris) for more info.
        # @!attribute [rw] image_uri
        #   @return [String]
        #     The URI of the source image. Can be either:
        #
        #     1. A Google Cloud Storage URI of the form
        #        `gs://bucket_name/object_name`. Object versioning is not supported. See
        #        [Google Cloud Storage Request
        #        URIs](https://cloud.google.com/storage/docs/reference-uris) for more
        #        info.
        #
        #     2. A publicly-accessible image HTTP/HTTPS URL. When fetching images from
        #        HTTP/HTTPS URLs, Google cannot guarantee that the request will be
        #        completed. Your request may fail if the specified host denies the
        #        request (e.g. due to request throttling or DOS prevention), or if Google
        #        throttles requests to the site for abuse prevention. You should not
        #        depend on externally-hosted images for production applications.
        #
        #     When both `gcs_image_uri` and `image_uri` are specified, `image_uri` takes
        #     precedence.
        class ImageSource; end

        # Client image to perform Google Cloud Vision API tasks over.
        # @!attribute [rw] content
        #   @return [String]
        #     Image content, represented as a stream of bytes.
        #     Note: As with all `bytes` fields, protobuffers use a pure binary
        #     representation, whereas JSON representations use base64.
        # @!attribute [rw] source
        #   @return [Google::Cloud::Vision::V1p3beta1::ImageSource]
        #     Google Cloud Storage image location, or publicly-accessible image
        #     URL. If both `content` and `source` are provided for an image, `content`
        #     takes precedence and is used to perform the image annotation request.
        class Image; end

        # A face annotation object contains the results of face detection.
        # @!attribute [rw] bounding_poly
        #   @return [Google::Cloud::Vision::V1p3beta1::BoundingPoly]
        #     The bounding polygon around the face. The coordinates of the bounding box
        #     are in the original image's scale, as returned in `ImageParams`.
        #     The bounding box is computed to "frame" the face in accordance with human
        #     expectations. It is based on the landmarker results.
        #     Note that one or more x and/or y coordinates may not be generated in the
        #     `BoundingPoly` (the polygon will be unbounded) if only a partial face
        #     appears in the image to be annotated.
        # @!attribute [rw] fd_bounding_poly
        #   @return [Google::Cloud::Vision::V1p3beta1::BoundingPoly]
        #     The `fd_bounding_poly` bounding polygon is tighter than the
        #     `boundingPoly`, and encloses only the skin part of the face. Typically, it
        #     is used to eliminate the face from any image analysis that detects the
        #     "amount of skin" visible in an image. It is not based on the
        #     landmarker results, only on the initial face detection, hence
        #     the <code>fd</code> (face detection) prefix.
        # @!attribute [rw] landmarks
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::FaceAnnotation::Landmark>]
        #     Detected face landmarks.
        # @!attribute [rw] roll_angle
        #   @return [Float]
        #     Roll angle, which indicates the amount of clockwise/anti-clockwise rotation
        #     of the face relative to the image vertical about the axis perpendicular to
        #     the face. Range [-180,180].
        # @!attribute [rw] pan_angle
        #   @return [Float]
        #     Yaw angle, which indicates the leftward/rightward angle that the face is
        #     pointing relative to the vertical plane perpendicular to the image. Range
        #     [-180,180].
        # @!attribute [rw] tilt_angle
        #   @return [Float]
        #     Pitch angle, which indicates the upwards/downwards angle that the face is
        #     pointing relative to the image's horizontal plane. Range [-180,180].
        # @!attribute [rw] detection_confidence
        #   @return [Float]
        #     Detection confidence. Range [0, 1].
        # @!attribute [rw] landmarking_confidence
        #   @return [Float]
        #     Face landmarking confidence. Range [0, 1].
        # @!attribute [rw] joy_likelihood
        #   @return [Google::Cloud::Vision::V1p3beta1::Likelihood]
        #     Joy likelihood.
        # @!attribute [rw] sorrow_likelihood
        #   @return [Google::Cloud::Vision::V1p3beta1::Likelihood]
        #     Sorrow likelihood.
        # @!attribute [rw] anger_likelihood
        #   @return [Google::Cloud::Vision::V1p3beta1::Likelihood]
        #     Anger likelihood.
        # @!attribute [rw] surprise_likelihood
        #   @return [Google::Cloud::Vision::V1p3beta1::Likelihood]
        #     Surprise likelihood.
        # @!attribute [rw] under_exposed_likelihood
        #   @return [Google::Cloud::Vision::V1p3beta1::Likelihood]
        #     Under-exposed likelihood.
        # @!attribute [rw] blurred_likelihood
        #   @return [Google::Cloud::Vision::V1p3beta1::Likelihood]
        #     Blurred likelihood.
        # @!attribute [rw] headwear_likelihood
        #   @return [Google::Cloud::Vision::V1p3beta1::Likelihood]
        #     Headwear likelihood.
        class FaceAnnotation
          # A face-specific landmark (for example, a face feature).
          # @!attribute [rw] type
          #   @return [Google::Cloud::Vision::V1p3beta1::FaceAnnotation::Landmark::Type]
          #     Face landmark type.
          # @!attribute [rw] position
          #   @return [Google::Cloud::Vision::V1p3beta1::Position]
          #     Face landmark position.
          class Landmark
            # Face landmark (feature) type.
            # Left and right are defined from the vantage of the viewer of the image
            # without considering mirror projections typical of photos. So, `LEFT_EYE`,
            # typically, is the person's right eye.
            module Type
              # Unknown face landmark detected. Should not be filled.
              UNKNOWN_LANDMARK = 0

              # Left eye.
              LEFT_EYE = 1

              # Right eye.
              RIGHT_EYE = 2

              # Left of left eyebrow.
              LEFT_OF_LEFT_EYEBROW = 3

              # Right of left eyebrow.
              RIGHT_OF_LEFT_EYEBROW = 4

              # Left of right eyebrow.
              LEFT_OF_RIGHT_EYEBROW = 5

              # Right of right eyebrow.
              RIGHT_OF_RIGHT_EYEBROW = 6

              # Midpoint between eyes.
              MIDPOINT_BETWEEN_EYES = 7

              # Nose tip.
              NOSE_TIP = 8

              # Upper lip.
              UPPER_LIP = 9

              # Lower lip.
              LOWER_LIP = 10

              # Mouth left.
              MOUTH_LEFT = 11

              # Mouth right.
              MOUTH_RIGHT = 12

              # Mouth center.
              MOUTH_CENTER = 13

              # Nose, bottom right.
              NOSE_BOTTOM_RIGHT = 14

              # Nose, bottom left.
              NOSE_BOTTOM_LEFT = 15

              # Nose, bottom center.
              NOSE_BOTTOM_CENTER = 16

              # Left eye, top boundary.
              LEFT_EYE_TOP_BOUNDARY = 17

              # Left eye, right corner.
              LEFT_EYE_RIGHT_CORNER = 18

              # Left eye, bottom boundary.
              LEFT_EYE_BOTTOM_BOUNDARY = 19

              # Left eye, left corner.
              LEFT_EYE_LEFT_CORNER = 20

              # Right eye, top boundary.
              RIGHT_EYE_TOP_BOUNDARY = 21

              # Right eye, right corner.
              RIGHT_EYE_RIGHT_CORNER = 22

              # Right eye, bottom boundary.
              RIGHT_EYE_BOTTOM_BOUNDARY = 23

              # Right eye, left corner.
              RIGHT_EYE_LEFT_CORNER = 24

              # Left eyebrow, upper midpoint.
              LEFT_EYEBROW_UPPER_MIDPOINT = 25

              # Right eyebrow, upper midpoint.
              RIGHT_EYEBROW_UPPER_MIDPOINT = 26

              # Left ear tragion.
              LEFT_EAR_TRAGION = 27

              # Right ear tragion.
              RIGHT_EAR_TRAGION = 28

              # Left eye pupil.
              LEFT_EYE_PUPIL = 29

              # Right eye pupil.
              RIGHT_EYE_PUPIL = 30

              # Forehead glabella.
              FOREHEAD_GLABELLA = 31

              # Chin gnathion.
              CHIN_GNATHION = 32

              # Chin left gonion.
              CHIN_LEFT_GONION = 33

              # Chin right gonion.
              CHIN_RIGHT_GONION = 34
            end
          end
        end

        # Detected entity location information.
        # @!attribute [rw] lat_lng
        #   @return [Google::Type::LatLng]
        #     lat/long location coordinates.
        class LocationInfo; end

        # A `Property` consists of a user-supplied name/value pair.
        # @!attribute [rw] name
        #   @return [String]
        #     Name of the property.
        # @!attribute [rw] value
        #   @return [String]
        #     Value of the property.
        # @!attribute [rw] uint64_value
        #   @return [Integer]
        #     Value of numeric properties.
        class Property; end

        # Set of detected entity features.
        # @!attribute [rw] mid
        #   @return [String]
        #     Opaque entity ID. Some IDs may be available in
        #     [Google Knowledge Graph Search
        #     API](https://developers.google.com/knowledge-graph/).
        # @!attribute [rw] locale
        #   @return [String]
        #     The language code for the locale in which the entity textual
        #     `description` is expressed.
        # @!attribute [rw] description
        #   @return [String]
        #     Entity textual description, expressed in its `locale` language.
        # @!attribute [rw] score
        #   @return [Float]
        #     Overall score of the result. Range [0, 1].
        # @!attribute [rw] confidence
        #   @return [Float]
        #     **Deprecated. Use `score` instead.**
        #     The accuracy of the entity detection in an image.
        #     For example, for an image in which the "Eiffel Tower" entity is detected,
        #     this field represents the confidence that there is a tower in the query
        #     image. Range [0, 1].
        # @!attribute [rw] topicality
        #   @return [Float]
        #     The relevancy of the ICA (Image Content Annotation) label to the
        #     image. For example, the relevancy of "tower" is likely higher to an image
        #     containing the detected "Eiffel Tower" than to an image containing a
        #     detected distant towering building, even though the confidence that
        #     there is a tower in each image may be the same. Range [0, 1].
        # @!attribute [rw] bounding_poly
        #   @return [Google::Cloud::Vision::V1p3beta1::BoundingPoly]
        #     Image region to which this entity belongs. Not produced
        #     for `LABEL_DETECTION` features.
        # @!attribute [rw] locations
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::LocationInfo>]
        #     The location information for the detected entity. Multiple
        #     `LocationInfo` elements can be present because one location may
        #     indicate the location of the scene in the image, and another location
        #     may indicate the location of the place where the image was taken.
        #     Location information is usually present for landmarks.
        # @!attribute [rw] properties
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::Property>]
        #     Some entities may have optional user-supplied `Property` (name/value)
        #     fields, such a score or string that qualifies the entity.
        class EntityAnnotation; end

        # Set of detected objects with bounding boxes.
        # @!attribute [rw] mid
        #   @return [String]
        #     Object ID that should align with EntityAnnotation mid.
        # @!attribute [rw] language_code
        #   @return [String]
        #     The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        #     information, see
        #     http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # @!attribute [rw] name
        #   @return [String]
        #     Object name, expressed in its `language_code` language.
        # @!attribute [rw] score
        #   @return [Float]
        #     Score of the result. Range [0, 1].
        # @!attribute [rw] bounding_poly
        #   @return [Google::Cloud::Vision::V1p3beta1::BoundingPoly]
        #     Image region to which this object belongs. This must be populated.
        class LocalizedObjectAnnotation; end

        # Set of features pertaining to the image, computed by computer vision
        # methods over safe-search verticals (for example, adult, spoof, medical,
        # violence).
        # @!attribute [rw] adult
        #   @return [Google::Cloud::Vision::V1p3beta1::Likelihood]
        #     Represents the adult content likelihood for the image. Adult content may
        #     contain elements such as nudity, pornographic images or cartoons, or
        #     sexual activities.
        # @!attribute [rw] spoof
        #   @return [Google::Cloud::Vision::V1p3beta1::Likelihood]
        #     Spoof likelihood. The likelihood that an modification
        #     was made to the image's canonical version to make it appear
        #     funny or offensive.
        # @!attribute [rw] medical
        #   @return [Google::Cloud::Vision::V1p3beta1::Likelihood]
        #     Likelihood that this is a medical image.
        # @!attribute [rw] violence
        #   @return [Google::Cloud::Vision::V1p3beta1::Likelihood]
        #     Likelihood that this image contains violent content.
        # @!attribute [rw] racy
        #   @return [Google::Cloud::Vision::V1p3beta1::Likelihood]
        #     Likelihood that the request image contains racy content. Racy content may
        #     include (but is not limited to) skimpy or sheer clothing, strategically
        #     covered nudity, lewd or provocative poses, or close-ups of sensitive
        #     body areas.
        class SafeSearchAnnotation; end

        # Rectangle determined by min and max `LatLng` pairs.
        # @!attribute [rw] min_lat_lng
        #   @return [Google::Type::LatLng]
        #     Min lat/long pair.
        # @!attribute [rw] max_lat_lng
        #   @return [Google::Type::LatLng]
        #     Max lat/long pair.
        class LatLongRect; end

        # Color information consists of RGB channels, score, and the fraction of
        # the image that the color occupies in the image.
        # @!attribute [rw] color
        #   @return [Google::Type::Color]
        #     RGB components of the color.
        # @!attribute [rw] score
        #   @return [Float]
        #     Image-specific score for this color. Value in range [0, 1].
        # @!attribute [rw] pixel_fraction
        #   @return [Float]
        #     The fraction of pixels the color occupies in the image.
        #     Value in range [0, 1].
        class ColorInfo; end

        # Set of dominant colors and their corresponding scores.
        # @!attribute [rw] colors
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::ColorInfo>]
        #     RGB color values with their score and pixel fraction.
        class DominantColorsAnnotation; end

        # Stores image properties, such as dominant colors.
        # @!attribute [rw] dominant_colors
        #   @return [Google::Cloud::Vision::V1p3beta1::DominantColorsAnnotation]
        #     If present, dominant colors completed successfully.
        class ImageProperties; end

        # Single crop hint that is used to generate a new crop when serving an image.
        # @!attribute [rw] bounding_poly
        #   @return [Google::Cloud::Vision::V1p3beta1::BoundingPoly]
        #     The bounding polygon for the crop region. The coordinates of the bounding
        #     box are in the original image's scale, as returned in `ImageParams`.
        # @!attribute [rw] confidence
        #   @return [Float]
        #     Confidence of this being a salient region.  Range [0, 1].
        # @!attribute [rw] importance_fraction
        #   @return [Float]
        #     Fraction of importance of this salient region with respect to the original
        #     image.
        class CropHint; end

        # Set of crop hints that are used to generate new crops when serving images.
        # @!attribute [rw] crop_hints
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::CropHint>]
        #     Crop hint results.
        class CropHintsAnnotation; end

        # Parameters for crop hints annotation request.
        # @!attribute [rw] aspect_ratios
        #   @return [Array<Float>]
        #     Aspect ratios in floats, representing the ratio of the width to the height
        #     of the image. For example, if the desired aspect ratio is 4/3, the
        #     corresponding float value should be 1.33333.  If not specified, the
        #     best possible crop is returned. The number of provided aspect ratios is
        #     limited to a maximum of 16; any aspect ratios provided after the 16th are
        #     ignored.
        class CropHintsParams; end

        # Parameters for web detection request.
        # @!attribute [rw] include_geo_results
        #   @return [true, false]
        #     Whether to include results derived from the geo information in the image.
        class WebDetectionParams; end

        # Image context and/or feature-specific parameters.
        # @!attribute [rw] lat_long_rect
        #   @return [Google::Cloud::Vision::V1p3beta1::LatLongRect]
        #     Not used.
        # @!attribute [rw] language_hints
        #   @return [Array<String>]
        #     List of languages to use for TEXT_DETECTION. In most cases, an empty value
        #     yields the best results since it enables automatic language detection. For
        #     languages based on the Latin alphabet, setting `language_hints` is not
        #     needed. In rare cases, when the language of the text in the image is known,
        #     setting a hint will help get better results (although it will be a
        #     significant hindrance if the hint is wrong). Text detection returns an
        #     error if one or more of the specified languages is not one of the
        #     [supported languages](https://cloud.google.com/vision/docs/languages).
        # @!attribute [rw] crop_hints_params
        #   @return [Google::Cloud::Vision::V1p3beta1::CropHintsParams]
        #     Parameters for crop hints annotation request.
        # @!attribute [rw] product_search_params
        #   @return [Google::Cloud::Vision::V1p3beta1::ProductSearchParams]
        #     Parameters for product search.
        # @!attribute [rw] web_detection_params
        #   @return [Google::Cloud::Vision::V1p3beta1::WebDetectionParams]
        #     Parameters for web detection.
        class ImageContext; end

        # Request for performing Google Cloud Vision API tasks over a user-provided
        # image, with user-requested features.
        # @!attribute [rw] image
        #   @return [Google::Cloud::Vision::V1p3beta1::Image]
        #     The image to be processed.
        # @!attribute [rw] features
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::Feature>]
        #     Requested features.
        # @!attribute [rw] image_context
        #   @return [Google::Cloud::Vision::V1p3beta1::ImageContext]
        #     Additional context that may accompany the image.
        class AnnotateImageRequest; end

        # If an image was produced from a file (e.g. a PDF), this message gives
        # information about the source of that image.
        # @!attribute [rw] uri
        #   @return [String]
        #     The URI of the file used to produce the image.
        # @!attribute [rw] page_number
        #   @return [Integer]
        #     If the file was a PDF or TIFF, this field gives the page number within
        #     the file used to produce the image.
        class ImageAnnotationContext; end

        # Response to an image annotation request.
        # @!attribute [rw] face_annotations
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::FaceAnnotation>]
        #     If present, face detection has completed successfully.
        # @!attribute [rw] landmark_annotations
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::EntityAnnotation>]
        #     If present, landmark detection has completed successfully.
        # @!attribute [rw] logo_annotations
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::EntityAnnotation>]
        #     If present, logo detection has completed successfully.
        # @!attribute [rw] label_annotations
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::EntityAnnotation>]
        #     If present, label detection has completed successfully.
        # @!attribute [rw] localized_object_annotations
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::LocalizedObjectAnnotation>]
        #     If present, localized object detection has completed successfully.
        #     This will be sorted descending by confidence score.
        # @!attribute [rw] text_annotations
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::EntityAnnotation>]
        #     If present, text (OCR) detection has completed successfully.
        # @!attribute [rw] full_text_annotation
        #   @return [Google::Cloud::Vision::V1p3beta1::TextAnnotation]
        #     If present, text (OCR) detection or document (OCR) text detection has
        #     completed successfully.
        #     This annotation provides the structural hierarchy for the OCR detected
        #     text.
        # @!attribute [rw] safe_search_annotation
        #   @return [Google::Cloud::Vision::V1p3beta1::SafeSearchAnnotation]
        #     If present, safe-search annotation has completed successfully.
        # @!attribute [rw] image_properties_annotation
        #   @return [Google::Cloud::Vision::V1p3beta1::ImageProperties]
        #     If present, image properties were extracted successfully.
        # @!attribute [rw] crop_hints_annotation
        #   @return [Google::Cloud::Vision::V1p3beta1::CropHintsAnnotation]
        #     If present, crop hints have completed successfully.
        # @!attribute [rw] web_detection
        #   @return [Google::Cloud::Vision::V1p3beta1::WebDetection]
        #     If present, web detection has completed successfully.
        # @!attribute [rw] product_search_results
        #   @return [Google::Cloud::Vision::V1p3beta1::ProductSearchResults]
        #     If present, product search has completed successfully.
        # @!attribute [rw] error
        #   @return [Google::Rpc::Status]
        #     If set, represents the error message for the operation.
        #     Note that filled-in image annotations are guaranteed to be
        #     correct, even when `error` is set.
        # @!attribute [rw] context
        #   @return [Google::Cloud::Vision::V1p3beta1::ImageAnnotationContext]
        #     If present, contextual information is needed to understand where this image
        #     comes from.
        class AnnotateImageResponse; end

        # Response to a single file annotation request. A file may contain one or more
        # images, which individually have their own responses.
        # @!attribute [rw] input_config
        #   @return [Google::Cloud::Vision::V1p3beta1::InputConfig]
        #     Information about the file for which this response is generated.
        # @!attribute [rw] responses
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::AnnotateImageResponse>]
        #     Individual responses to images found within the file.
        class AnnotateFileResponse; end

        # Multiple image annotation requests are batched into a single service call.
        # @!attribute [rw] requests
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::AnnotateImageRequest>]
        #     Individual image annotation requests for this batch.
        class BatchAnnotateImagesRequest; end

        # Response to a batch image annotation request.
        # @!attribute [rw] responses
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::AnnotateImageResponse>]
        #     Individual responses to image annotation requests within the batch.
        class BatchAnnotateImagesResponse; end

        # An offline file annotation request.
        # @!attribute [rw] input_config
        #   @return [Google::Cloud::Vision::V1p3beta1::InputConfig]
        #     Required. Information about the input file.
        # @!attribute [rw] features
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::Feature>]
        #     Required. Requested features.
        # @!attribute [rw] image_context
        #   @return [Google::Cloud::Vision::V1p3beta1::ImageContext]
        #     Additional context that may accompany the image(s) in the file.
        # @!attribute [rw] output_config
        #   @return [Google::Cloud::Vision::V1p3beta1::OutputConfig]
        #     Required. The desired output location and metadata (e.g. format).
        class AsyncAnnotateFileRequest; end

        # The response for a single offline file annotation request.
        # @!attribute [rw] output_config
        #   @return [Google::Cloud::Vision::V1p3beta1::OutputConfig]
        #     The output location and metadata from AsyncAnnotateFileRequest.
        class AsyncAnnotateFileResponse; end

        # Multiple async file annotation requests are batched into a single service
        # call.
        # @!attribute [rw] requests
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::AsyncAnnotateFileRequest>]
        #     Individual async file annotation requests for this batch.
        class AsyncBatchAnnotateFilesRequest; end

        # Response to an async batch file annotation request.
        # @!attribute [rw] responses
        #   @return [Array<Google::Cloud::Vision::V1p3beta1::AsyncAnnotateFileResponse>]
        #     The list of file annotation responses, one for each request in
        #     AsyncBatchAnnotateFilesRequest.
        class AsyncBatchAnnotateFilesResponse; end

        # The desired input location and metadata.
        # @!attribute [rw] gcs_source
        #   @return [Google::Cloud::Vision::V1p3beta1::GcsSource]
        #     The Google Cloud Storage location to read the input from.
        # @!attribute [rw] mime_type
        #   @return [String]
        #     The type of the file. Currently only "application/pdf" and "image/tiff"
        #     are supported. Wildcards are not supported.
        class InputConfig; end

        # The desired output location and metadata.
        # @!attribute [rw] gcs_destination
        #   @return [Google::Cloud::Vision::V1p3beta1::GcsDestination]
        #     The Google Cloud Storage location to write the output(s) to.
        # @!attribute [rw] batch_size
        #   @return [Integer]
        #     The max number of response protos to put into each output JSON file on
        #     Google Cloud Storage.
        #     The valid range is [1, 100]. If not specified, the default value is 20.
        #
        #     For example, for one pdf file with 100 pages, 100 response protos will
        #     be generated. If `batch_size` = 20, then 5 json files each
        #     containing 20 response protos will be written under the prefix
        #     `gcs_destination`.`uri`.
        #
        #     Currently, batch_size only applies to GcsDestination, with potential future
        #     support for other output configurations.
        class OutputConfig; end

        # The Google Cloud Storage location where the input will be read from.
        # @!attribute [rw] uri
        #   @return [String]
        #     Google Cloud Storage URI for the input file. This must only be a
        #     Google Cloud Storage object. Wildcards are not currently supported.
        class GcsSource; end

        # The Google Cloud Storage location where the output will be written to.
        # @!attribute [rw] uri
        #   @return [String]
        #     Google Cloud Storage URI where the results will be stored. Results will
        #     be in JSON format and preceded by its corresponding input URI. This field
        #     can either represent a single file, or a prefix for multiple outputs.
        #     Prefixes must end in a `/`.
        #
        #     Examples:
        #
        #     * File: gs://bucket-name/filename.json
        #     * Prefix: gs://bucket-name/prefix/here/
        #     * File: gs://bucket-name/prefix/here
        #
        #     If multiple outputs, each response is still AnnotateFileResponse, each of
        #     which contains some subset of the full list of AnnotateImageResponse.
        #     Multiple outputs can happen if, for example, the output JSON is too large
        #     and overflows into multiple sharded files.
        class GcsDestination; end

        # Contains metadata for the BatchAnnotateImages operation.
        # @!attribute [rw] state
        #   @return [Google::Cloud::Vision::V1p3beta1::OperationMetadata::State]
        #     Current state of the batch operation.
        # @!attribute [rw] create_time
        #   @return [Google::Protobuf::Timestamp]
        #     The time when the batch request was received.
        # @!attribute [rw] update_time
        #   @return [Google::Protobuf::Timestamp]
        #     The time when the operation result was last updated.
        class OperationMetadata
          # Batch operation states.
          module State
            # Invalid.
            STATE_UNSPECIFIED = 0

            # Request is received.
            CREATED = 1

            # Request is actively being processed.
            RUNNING = 2

            # The batch processing is done.
            DONE = 3

            # The batch processing was cancelled.
            CANCELLED = 4
          end
        end

        # A bucketized representation of likelihood, which is intended to give clients
        # highly stable results across model upgrades.
        module Likelihood
          # Unknown likelihood.
          UNKNOWN = 0

          # It is very unlikely that the image belongs to the specified vertical.
          VERY_UNLIKELY = 1

          # It is unlikely that the image belongs to the specified vertical.
          UNLIKELY = 2

          # It is possible that the image belongs to the specified vertical.
          POSSIBLE = 3

          # It is likely that the image belongs to the specified vertical.
          LIKELY = 4

          # It is very likely that the image belongs to the specified vertical.
          VERY_LIKELY = 5
        end
      end
    end
  end
end
require 'forwardable'
require 'json'
require 'yaml'

require 'linguistics_latin'

require 'latinverb/latinverb'
require 'latinverb/errors'
require 'latinverb/components/chart_presenter'
require 'latinverb/components/deponent_string_deriver'
require 'latinverb/components/infinitivizer'
require 'latinverb/components/deponent_infinitivizer'
require 'latinverb/components/classifier'
require 'latinverb/components/principal_parts_extractor'
require 'latinverb/components/type_evaluator'
require 'latinverb/components/participler'
require 'latinverb/components/deponent_participler'
require 'latinverb/components/validator'
require 'latinverb/components/imperatives_handler'
require 'latinverb/components/deponent_imperatives_handler'
require 'latinverb/components/stem_deriver'
require 'latinverb/components/present_only_checker'
require 'latinverb/components/passive_infinitive_factory'
require 'latinverb/formatters/triplicate_and_pluralize_formatters'
require 'latinverb/tense_block'
require 'latinverb/imperative_block'
require 'latinverb/version'
require 'latinverb/querent/first/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/first/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/first/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/first/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/first/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/first/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/first/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/first/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/fourth/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/fourth/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/fourth/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/fourth/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/fourth/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/fourth/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/fourth/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/fourth/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_imperative_mood_future_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_imperative_mood_present_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_indicative_mood_futureperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_indicative_mood_pastperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_indicative_mood_perfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_subjunctive_mood_imperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_subjunctive_mood_pastperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_subjunctive_mood_perfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_indicative_mood_futureperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_indicative_mood_pastperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_indicative_mood_perfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_subjunctive_mood_imperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_subjunctive_mood_pastperfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_subjunctive_mood_perfect_tense_methods'
require 'latinverb/querent/irregular/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/second/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/second/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/second/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/second/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/second/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/second/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/second/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/second/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/third/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/third/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/third/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/third/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/third/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/third/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/third/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/third/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/third_io/tense_method_definitions/active_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/third_io/tense_method_definitions/active_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/third_io/tense_method_definitions/active_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/third_io/tense_method_definitions/active_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/querent/third_io/tense_method_definitions/passive_voice_indicative_mood_future_tense_methods'
require 'latinverb/querent/third_io/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/querent/third_io/tense_method_definitions/passive_voice_indicative_mood_present_tense_methods'
require 'latinverb/querent/third_io/tense_method_definitions/passive_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_imperative_mood_future_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_imperative_mood_present_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_indicative_mood_futureperfect_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_indicative_mood_pastperfect_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_indicative_mood_perfect_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_subjunctive_mood_imperfect_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_subjunctive_mood_pastperfect_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_subjunctive_mood_perfect_tense_methods'
require 'latinverb/tense_method_definitions/active_voice_subjunctive_mood_perfect_tense_methods'
require 'latinverb/tense_method_definitions/passive_voice_indicative_mood_futureperfect_tense_methods'
require 'latinverb/tense_method_definitions/passive_voice_indicative_mood_pastperfect_tense_methods'
require 'latinverb/tense_method_definitions/passive_voice_indicative_mood_perfect_tense_methods'
require 'latinverb/tense_method_definitions/passive_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/tense_method_definitions/passive_voice_subjunctive_mood_pastperfect_tense_methods'
require 'latinverb/tense_method_definitions/passive_voice_subjunctive_mood_perfect_tense_methods'
require 'latinverb/querent/querent_interface'
require 'latinverb/querent'
require 'latinverb/querent/first'
require 'latinverb/querent/second'
require 'latinverb/querent/third'
require 'latinverb/querent/third_io'
require 'latinverb/querent/fourth'
require 'latinverb/querent/irregular'
require 'latinverb/querent/impersonal'
require 'latinverb/querent_factory'
require 'latinverb/querent_mutators/irregular'
require 'latinverb/querent_mutators/semideponent'
require 'latinverb/tense_block/null_tense_block'
require 'latinverb/querent_for_classification_strategy/irregular'
require 'latinverb/querent_for_classification_strategy/regular'
require 'latinverb/querent_for_classification_strategy/present_only'
require 'latinverb/querent_for_classification_strategy/deponent'
require 'latinverb/querent_for_classification_strategy/semideponent'
require 'latinverb/querent_for_classification_strategy/impersonal'
require 'latinverb/querent_for_classification_builder'
require 'latinverb/irregular_components_builder'
require 'latinverb/components_factory'
require 'latinverb/components/classifier/strategies/verb_classification_strategy'
require 'latinverb/components/classifier/strategies/defective_verb_classification_strategy'
require 'latinverb/components/classifier/strategies/irregular_verb_classification_strategy'
require 'latinverb/components/classifier/strategies/semideponent_verb_classification_strategy'
require 'latinverb/components/classifier/strategies/impersonal_verb_classification_strategy'
require 'latinverb/components/classifier/strategies/very_irregular_verb_classification_strategy'
require 'latinverb/components/classifier/strategies/deponent_verb_classification_strategy'
require 'latinverb/components/classifier/strategies/present_only_verb_classification_strategy'
require 'latinverb/components/classifier/strategies/regular_verb_classification_strategy'
require 'latinverb/semideponent_querent_adapter/nullified_passive_voice_tense_blocks'
require 'latinverb/semideponent_querent_adapter/active_voice_indicative_mood_present_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_indicative_mood_pastperfect_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_indicative_mood_imperfect_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_indicative_mood_perfect_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_indicative_mood_future_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_indicative_mood_futureperfect_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_subjunctive_mood_imperfect_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_subjunctive_mood_perfect_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_subjunctive_mood_pastperfect_tense_methods'
require 'latinverb/semideponent_querent_adapter/active_voice_subjunctive_mood_present_tense_methods'
require 'latinverb/semideponent_querent_adapter'
require 'latinverb/past_and_perfect_tense_block_eclipser'
require 'latinverb/querent/impersonal_verb_mixin'
require 'latinverb/tenses'
require 'latinverb/imperative_block/imperative_rule_factory'
require 'latinverb/irregular_verb_serialization_retriever'
require 'latinverb/querent_mutators/irregular/json_deserializer'
require 'latinverb/querent_mutators/irregular/supine_inferrer.rb'
require 'latinverb/querent/querent_interface'
require 'latinverb/serialization/json'
require 'latinverb/serialization/yaml'
require 'latinverb/serialization/hash'
require 'latinverb/tense_block/vector_resolution_delegate'
require 'latinverb/tense_block/null_tense_block'
require 'latinverb/paradigmatic_verbs'

module Linguistics
  module Latin
    module Verb
      class LatinVerb
      end
    end
  end
end

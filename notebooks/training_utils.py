import tensorflow as tf

def create_hparams(hparams_overrides=None):
  """Creates default HParams with the option of overrides.

  Args:
    hparams_overrides: HParams overriding the otherwise provided defaults.
      Defaults to None (meaning no overrides take place). HParams specified need
      to be a referencing a subset of the defaults.

  Returns:
    Default HParams.
  """
  hparams = tf.contrib.training.HParams(
      # Sequence features are bucketed by their age at time of prediction in:
      # [time_windows[0] - time_windows[1]),
      # [time_windows[1] - time_windows[2]),
      # ...
      time_windows=[
          5 * 365 * 24 * 60 * 60,  # 5 years
          365 * 24 * 60 * 60,  # 1 year
          30 * 24 * 60 * 60,  # 1 month
          7 * 24 * 60 * 60,  # 1 week
          1 * 24 * 60 * 60,  # 1 day
          0,  # now
      ],
      batch_size=64,
      learning_rate=0.003,
      dedup=True,
      l1_regularization_strength=0.0,
      l2_regularization_strength=0.0,
      include_age=True,
      age_boundaries=[1, 5, 18, 30, 50, 70, 90],
      categorical_context_features=['Patient.gender'],
      sequence_features=[
          'Composition.section.text.div.tokenized',
          'Composition.type',
          'Condition.code',
          'Encounter.hospitalization.admitSource',
          'Encounter.reason.hcc',
          'MedicationRequest.contained.medication.code.gsn',
          'Procedure.code.cpt',
      ],
      # Number of hash buckets to map the tokens of the sequence_features into.
      sequence_bucket_sizes=[
          17000,
          16,
          3052,
          10,
          62,
          1600,
          732,
      ],
      # List of strings each of which is a ':'-separated list of feature that we
      # want to concatenate over the time dimension
      time_crossed_features=[
          '%s:%s:%s:%s' % ('Observation.code',
                           'Observation.value.quantity.value',
                           'Observation.value.quantity.unit',
                           'Observation.value.string')
      ],
      time_concat_bucket_sizes=[39571],
      context_bucket_sizes=[4])
  # Other overrides (possibly coming from vizier) are applied.
  if hparams_overrides:
    hparams = tf.training.merge_hparam(hparams, hparams_overrides)
  return hparams

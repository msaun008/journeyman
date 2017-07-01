class ScoreForecastJob < ApplicationJob
  queue_as :default



  # forecast  - the user submitted forecast
  # observed  - the actual observed forecast
  #
  def perform(forecast, observed)

    forecast = Forecast.find(1)
    observed = Forecast.find(4)

    score = 0

    # high_temp
    high_temp_delta = (observed.high_temp - forecast.high_temp).abs
    high_temp_score = high_temp_delta * 1
    puts "high_temp_score = #{high_temp_score}"

    # low_temp
    low_temp_delta = (observed.low_temp - forecast.low_temp).abs
    low_temp_score = low_temp_delta * 1
    puts "low_temp_score = #{low_temp_score}"

    # precipitation
    fp = forecast.precipitation
    op = observed.precipitation
    precip_score = 0

    scoring_levels = [
      [0.5, 0.1],
      [0.25, 0.2],
      [0.1, 0.3],
      [0.0, 0.4]
    ]

    scoring_levels.each do |threshold, points|
      # TODO fix algorithm for case when forecasted precip is greater than observed
      if(op > threshold)
        op_delta = op - threshold
        fp_delta = fp > threshold ? fp - threshold : 0
        delta = (op_delta - fp_delta).abs

        precip_score += delta * points * 100

        if (delta < op_delta)
          # this means our forecasted and observed precipitation amounts are
          # both above the threshold and we do not need to do any more
          # iterations, so we set the values to zero
          op = 0
          fp = 0
        else
          op = op - op_delta
          fp = fp - fp_delta
        end
      end
    end
    puts "precip_score = #{precip_score}"

    # wind
    wind_delta = (observed.low_temp - forecast.low_temp).abs
    wind_score = wind_delta * 0.5
    puts "wind_score = #{wind_score}"

    score = high_temp_score + low_temp_score + precip_score + wind_score
    puts "score = #{score}"
  end
end

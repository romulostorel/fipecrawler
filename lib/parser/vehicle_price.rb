class Parser::VehiclePrice
  def initialize(vehicle_price_hash)
    @vehicle_price_hash = vehicle_price_hash
  end

  def self.parse(vehicle_price_hash)
    new(vehicle_price_hash).parse
  end

  def parse
    {
      price: price,
      brand_id: brand_id,
      model_id: model_id,
      model_year: @vehicle_price_hash['AnoModelo'].to_i,
      fuel: @vehicle_price_hash['Combustivel'],
      fipe: @vehicle_price_hash['CodigoFipe'].delete(' '),
      reference_id: reference_id,
      vehicle_type: @vehicle_price_hash['TipoVeiculo']
    }
  end

  protected

  def model_id
    begin
      Models::Vehicle.by_name(@vehicle_price_hash['Modelo']).id
    rescue NoMethodError
      1000
    end
  end

  def brand_id
    begin
      Models::Brand.by_name(@vehicle_price_hash['Marca']).id
    rescue NoMethodError
      1000
    end
  end

  def reference_id
    begin
      Models::Reference.by_label(@vehicle_price_hash['MesReferencia'].strip).code
    rescue NoMethodError
      1000
    end
  end

  def price
    parse_price_string(@vehicle_price_hash['Valor'])
  end

  def parse_price_string(price)
    BigDecimal.new(price.delete('R$'))
  end
end

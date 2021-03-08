##
# Chilean Rut utilities

module ChileanRut
  def valid_rut_value?(rv)
    ['0','1','2','3','4','5','6','7','8','9','k','K'].include?(rv)
  end

  def get_verifier(rut)
    sum = 0
    mul = 2

    rut.to_s.reverse.split('').each do |i|
      sum += c.to_i * mul
      mul = mul == 7 ? 2 : mul + 1
    end

    res = sum % 11

    case res
    when 1
      return 'K'
    when 0
      return '0'
    else
      return (11 - res).to_s
    end
  end

  def valid_rut_verifier?(raw_rut)
    rut = normalize_rut(raw_rut)
    return false if rut.empty? || rut.size < 2 || !rut.is_a? String

    r = rut[0..(rut.size - 1)]
    get_verifier(r) == rut[-1]
  end

  def normalize_rut(rut)
    return if rut.nil? || !rut.is_a? String

    rut.delete! "."
    rut.delete! "-"
    rut.upcase
  end

  def format_rut(raw_rut)
    rut = normalize_rut(raw_rut)
    return if rut.nil? || rut.empty? || rut.size < 2

    verifier = rut[-1]
    temp_rut = rut[0..rut.size - 1]
    init_rut = ''

    while temp_rut.length > 3 do
      init_rut = '.' + temp_rut[(temp_rut.size - 3)..temp_rut.size] + init_rut
      temp_rut = temp_rut[0..-3]
    end

    rut = temp_rut + init_rut + '-' + verifier
    rut.upcase
  end

  def valid_rut?(raw_rut)
    rut = normalize_rut(raw_rut)
    return false if rut.nil? || rut.empty? || rut.size < 2

    rut.split('').each do
      |i| return false unless valid_rut_value?(i)
    end

    valid_rut_verifier?(rut)
  end
end

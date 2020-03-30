function Kp = gain(F, G, H, P, Q, R, S, n)
    % X_{i + 1} = F_i X_i + G_i U_i
    % Y_i = H_i X_i + V_i

    % \Pi_0 = <X_0, X_0>
    % Q_i = <U_i, U_i>
    % R_i = <V_i, V_i>
    % S_i = <U_i, V_i>

    % P_0 = \Pi_0
    % R_{e, i} = H_i P_i H_i^* + R_i
    % K_{p, i} = (F_i P_i H_i^* + G_i S_i) R_{e, i}^{-1}
    % P_{i + 1} = F_i P_i F_i^* + G_i Q_i G_i^* - K_{p, i} R_{e, i} K_{p, i}^*

    % x(n) = A x(n - 1) + w(n)
    % y(n) = C x(n) + v(n)

    Kp = {}
    for i = 1 : n
        Re = H * P * H.' + R
        Kp{i} = (F * P * H.' + G * S) * inv(Re)
        P = F * P * F.' + G * Q * G.' - Kp{i} * Re * Kp{i}.'
    end
end
